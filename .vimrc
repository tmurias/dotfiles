" START VUNDLE SETUP-----------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Let Vundle manage Vundle
Plugin 'scrooloose/nerdtree'  " File manager within vim

call vundle#end()

filetype plugin indent on
" END VUNDLE SETUP-------------------------------------------------------------


" Common settings across all vim configs
source ~/.vim/baseline.vim
 

" 256 colors - https://gist.github.com/limingjie/4975c36d13d0927613e6
if &term == "screen"
	set t_Co=256
endif

" Colorscheme
color gruvbox
let g:gruvbox_contrast_dark="hard"

" Disable when not using dark terminal
set background=dark

" Workaround for terminals that can't display fancy characters
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

autocmd FileType c call Indent2Spaces()
autocmd FileType h call Indent2Spaces()
autocmd FileType python call Indent2Spaces()
