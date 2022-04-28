"----------------------------------------------------------------------
"-PLUGINS
"----------------------------------------------------------------------
call plug#begin("~/.vim/plugged")
Plug 'dracula/vim'              " Colourscheme
Plug 'sainnhe/everforest'       " Colourscheme
Plug 'morhetz/gruvbox'          " Colourscheme
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'       " Git
Plug 'nvie/vim-flake8'          " Python linting
Plug 'jlanzarotta/bufexplorer'
Plug 'neovim/nvim-lspconfig'
Plug 'editorconfig/editorconfig-vim'
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

lua require('taylor.lspconfig')

badd +1 ~/dotfiles/.config/nvim/init.vim
