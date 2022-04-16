"----------------------------------------------------------------------
"-PLUGINS
"----------------------------------------------------------------------
source $HOME/.config/nvim/modules/cscope_map.vim

call plug#begin("~/.vim/plugged")
Plug 'dracula/vim'              " Colourscheme
Plug 'sainnhe/everforest'       " Colourscheme
Plug 'morhetz/gruvbox'          " Colourscheme
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'davidhalter/jedi-vim'     " Python autocomplete
Plug 'tpope/vim-fugitive'       " Git
Plug 'nvie/vim-flake8'          " Python linting
Plug 'jlanzarotta/bufexplorer'
call plug#end()

source ~/dotfiles/.vim/baseline.vim

set background=dark

" Theme
if (has("termguicolors"))
	set termguicolors
endif

if exists("$TMUX")
	colorscheme gruvbox
else
	colorscheme dracula
endif

autocmd FileType c call Indent4Spaces()
autocmd FileType h call Indent4Spaces()
autocmd FileType vim call IndentTab8()

badd +1 ~/dotfiles/.config/nvim/init.vim
