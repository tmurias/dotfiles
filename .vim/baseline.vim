" Show line numbers
set number

" Set padding for scrolling
set scrolloff=3

" Gets rid of annoying delay when exiting visual mode
set timeoutlen=1000 ttimeoutlen=0

" Allow project-level vimrc settings
set exrc

" Disable unsafe commands in project-level vimrcs
set secure

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

" Taglist settings
let g:Tlist_Show_One_File=1
let g:Tlist_Use_Right_Window=1

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

function! IndentTab8()
	set tabstop=8
	set softtabstop=0
	set shiftwidth=8
	set noexpandtab
endfunction
command! IndentTab8 call IndentTab8()

command! NE NERDTreeToggle

command! TL TlistToggle
