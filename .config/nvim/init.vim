set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let g:netrw_banner=0

set clipboard=unnamedplus
set guicursor+=a:blinkon700
set hidden
set laststatus=1
set shortmess+=I

augroup Colors
	autocmd!
	autocmd Syntax * call SetColors()
augroup END

function! SetColors() abort
	if &background ==# "dark"
		highlight Directory ctermfg=cyan
		highlight SpecialKey ctermfg=cyan
		highlight Type ctermfg=green
		highlight PreProc ctermfg=blue
	endif
endfunction
