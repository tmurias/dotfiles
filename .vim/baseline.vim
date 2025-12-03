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

" Always show statusline (filename at bottom)
set laststatus=2

" Not enabled by default on gVim
set ruler

" Line wrap makes code harder to read imo
set nowrap

" Make backspace work like most modern programs
set backspace=indent,eol,start

" Use ripgrep for grep
set grepprg=rg\ --vimgrep


"----------------------------------------------------------------------
"- PLUGIN SETTINGS
"----------------------------------------------------------------------

" NERDTree file browser
let g:NERDTreeHijackNetrw=0 " Use netrw instead of NT when running "vim ."

" Tagbar (summary of functions and stuff)
let g:tagbar_sort = 0

" Colorscheme
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="hard"

" Colorscheme
let g:everforest_background = "hard"


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

function! ShowTrailingWhitespace()
	highlight ExtraWhitespace ctermbg=red guibg=red
	match ExtraWhitespace /\s\+$/
endfunction

function! HideTrailingWhitespace()
	highlight ExtraWhitespace ctermbg=NONE guibg=NONE
	match ExtraWhitespace /\s\+$/
endfunction


"----------------------------------------------------------------------
"- COMMANDS
"----------------------------------------------------------------------

command! Indent2Spaces call Indent2Spaces()
command! Indent4Spaces call Indent4Spaces()
command! IndentTab4 call IndentTab4()
command! IndentTab8 call IndentTab8()

command! ShowTrailSpace call ShowTrailingWhitespace()
command! HideTrailSpace call HideTrailingWhitespace()

" Find references in all files
command! -nargs=1 Arefs execute 'grep! -w --no-ignore ' . shellescape(expand('<cword>')) . ' ' . <q-args> | copen
" Find references in C/C++ files
command! -nargs=1 Crefs execute 'grep! -w --no-ignore ' . shellescape(expand('<cword>')) . ' -g "*.c" -g "*.cpp" -g "*.h" ' . <q-args> | copen


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
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>q @q
nnoremap <leader>ra :Arefs .<CR>
nnoremap <leader>rc :Crefs .<CR>


"----------------------------------------------------------------------
"- FILETYPE CUSTOMIZATIONS
"----------------------------------------------------------------------

" Wrap long lines and break between words when editing markdown
autocmd BufRead,BufNewFile *.md setlocal wrap linebreak

" Move the quickfix window to the bottom of all other windows when it opens.
" This is mostly to prevent qf from opening underneath tagbar.
autocmd FileType qf wincmd J

" Don't insert the next // when hitting enter on a C++ style comment
autocmd FileType c setlocal comments-=://


"----------------------------------------------------------------------
"- STARTUP ACTIONS
"----------------------------------------------------------------------

badd +1 ~/dotfiles/.vim/baseline.vim
