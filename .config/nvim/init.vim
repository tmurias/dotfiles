"------------------------------------------------------------------------------
"-PLUGINS
"------------------------------------------------------------------------------
source $HOME/.config/nvim/modules/cscope_map.vim

call plug#begin("~/.vim/plugged")
Plug 'dracula/vim'
Plug 'sainnhe/everforest'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'davidhalter/jedi-vim'
call plug#end()


"------------------------------------------------------------------------------
"-SETTINGS
"------------------------------------------------------------------------------
"" General config
set scrolloff=3
set number
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set mouse=a
syntax enable
filetype plugin indent on

" Open vert. splits on right, horiz. splits below
set splitright
set splitbelow

" Doing this to get rid of the annoying delay when exiting visual mode
set timeoutlen=1000 ttimeoutlen=0

" Allow project-level vimrc settings
set exrc

" Disable unsafe commands in project-level vimrcs
set secure

" Jedi config
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0

" Everforest config
let g:everforest_background = "hard"

" Theme
if (has("termguicolors"))
	set termguicolors
endif
colorscheme dracula

"------------------------------------------------------------------------------
"-MACROS
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
"-FUNCTIONS
"------------------------------------------------------------------------------
function! Indent2Spaces()
	set tabstop=8
	set softtabstop=2
	set shiftwidth=2
	set expandtab
endfunction
command! Indent2Spaces call Indent2Spaces()

function! Indent4Spaces()
	set tabstop=8
	set softtabstop=4
	set shiftwidth=4
	set expandtab
endfunction
command! Indent4Spaces call Indent4Spaces()

function! IndentTab4()
	set tabstop=4
	set softtabstop=0
	set shiftwidth=4
	set noexpandtab
endfunction
command! IndentTab4 call IndentTab4()

function! IndentTab8()
	set tabstop=8
	set softtabstop=0
	set shiftwidth=8
	set noexpandtab
endfunction
command! IndentTab8 call IndentTab8()

command NE NERDTreeToggle

autocmd FileType c call Indent4Spaces()
autocmd FileType h call Indent4Spaces()
