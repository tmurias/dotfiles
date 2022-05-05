" START PLUGIN SETUP---------------------------------------------------
call plug#begin("~/.vim/plugged")
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-fugitive'
Plug 'nvie/vim-flake8'
Plug 'yegappan/taglist'
Plug 'tmurias/bufexplorer'
Plug 'editorconfig/editorconfig-vim'
call plug#end()
" END PLUGIN SETUP-----------------------------------------------------


" Common settings across all vim configs
source ~/dotfiles/.vim/baseline.vim


" 256 colors - https://gist.github.com/limingjie/4975c36d13d0927613e6
if &term == "screen"
	set t_Co=256
endif

" Colorscheme
color gruvbox

" Disable when not using dark terminal
set background=dark

" Workaround for terminals that can't display fancy characters
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"


badd +1 ~/dotfiles/.vimrc
