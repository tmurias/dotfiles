"----------------------------------------------------------------------
"- GENERAL SETTINGS
"----------------------------------------------------------------------

" Show line numbers
set number

" Set padding for scrolling
set scrolloff=3

" Gets rid of annoying delay when exiting visual mode
set timeoutlen=1000 ttimeoutlen=0

" Make subdirectories search up the tree for a tags file
set tags=tags;/

" Indent to same level as last line
set autoindent

" Indent when a block is detected
set smartindent

" Open vertical splits on the right, horizontal splits below
set splitright
set splitbelow

" Enable mouse
set mouse=a

" Search recursively into subdirectories
set path+=**

" Always show filename at bottom
set laststatus=2

" Not enabled by default on gVim
set ruler

" Makes wrapped lines easier to read
set breakindent

" When there are multiple options for a definition, this lets you choose
set cscopetag


"----------------------------------------------------------------------
"- PLUGIN SETTINGS
"----------------------------------------------------------------------

" Gruvbox colourscheme settings
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="hard"

" Everforest config
let g:everforest_background = "hard"

" Jedi setings
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0


"----------------------------------------------------------------------
"- FUNCTIONS
"----------------------------------------------------------------------

function! Indent2Spaces()
	set tabstop=8
	set softtabstop=2
	set shiftwidth=2
	set expandtab
endfunction

function! Indent4Spaces()
	set tabstop=8
	set softtabstop=4
	set shiftwidth=4
	set expandtab
endfunction

function! IndentTab4()
	set tabstop=4
	set softtabstop=0
	set shiftwidth=4
	set noexpandtab
endfunction

function! IndentTab8()
	set tabstop=8
	set softtabstop=0
	set shiftwidth=8
	set noexpandtab
endfunction


"----------------------------------------------------------------------
"- COMMANDS
"----------------------------------------------------------------------

command! Indent2Spaces call Indent2Spaces()
command! Indent4Spaces call Indent4Spaces()
command! IndentTab4 call IndentTab4()
command! IndentTab8 call IndentTab8()

command! NE NERDTreeToggle
command! TL TagbarToggle


"----------------------------------------------------------------------
"- KEY MAPPINGS
"----------------------------------------------------------------------

let mapleader=" "
vnoremap <leader>x "+d
vnoremap <leader>c "+y
vnoremap <leader>v "+p
nnoremap <leader>v "+p
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>


"----------------------------------------------------------------------
"- STARTUP ACTIONS
"----------------------------------------------------------------------

badd +1 ~/dotfiles/.vim/baseline.vim
