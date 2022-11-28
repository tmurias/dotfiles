"----------------------------------------------------------------------
"-PLUGINS
"----------------------------------------------------------------------
call plug#begin()
Plug 'tmurias/nerdtree'
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-fugitive'       " Git
Plug 'nvie/vim-flake8'          " Python linting
Plug 'tmurias/bufexplorer'
Plug 'neovim/nvim-lspconfig'
Plug 'editorconfig/editorconfig-vim'
Plug 'preservim/tagbar'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Colorschemes
Plug 'dracula/vim'
Plug 'sainnhe/everforest'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'tomasr/molokai'
Plug 'nlknguyen/papercolor-theme'
Plug 'mhartington/oceanic-next'
call plug#end()


source ~/dotfiles/.vim/baseline.vim

lua require('taylor.lspconfig')
lua require('taylor.treesitterconfig')


function! SetColorscheme(darkmode)
	if exists("$TMUX") || (!a:darkmode)
		colorscheme gruvbox
	else
		colorscheme OceanicNext
	endif
endfunction

function! LightMode()
	set background=light
	call SetColorscheme(0)
endfunction

function! DarkMode()
	set background=dark
	call SetColorscheme(1)
endfunction

if (has("termguicolors"))
	set termguicolors
endif
call DarkMode()

command! LightMode call LightMode()
command! DarkMode call DarkMode()

lua require('nvim-autopairs').setup{}

badd +1 ~/dotfiles/.config/nvim/init.vim
