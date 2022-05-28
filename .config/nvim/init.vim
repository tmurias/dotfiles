"----------------------------------------------------------------------
"-PLUGINS
"----------------------------------------------------------------------
call plug#begin()
Plug 'dracula/vim'              " Colourscheme
Plug 'sainnhe/everforest'       " Colourscheme
Plug 'morhetz/gruvbox'          " Colourscheme
Plug 'tmurias/nerdtree'
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-fugitive'       " Git
Plug 'nvie/vim-flake8'          " Python linting
Plug 'tmurias/bufexplorer'
Plug 'neovim/nvim-lspconfig'
Plug 'editorconfig/editorconfig-vim'
Plug 'preservim/tagbar'
call plug#end()

source ~/dotfiles/.vim/baseline.vim

lua require('taylor.lspconfig')


function! SetColorscheme(darkmode)
	if exists("$TMUX") || (!a:darkmode)
		colorscheme gruvbox
	else
		colorscheme default
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
