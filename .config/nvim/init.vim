set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

set laststatus=1

" https://github.com/neovim/neovim/blob/e75e9c10dc947bc4aac0aea927e47038bf984b7f/src/nvim/syntax.c#L5888
if &background ==# "light"
	highlight ColorColumn  ctermbg=Red
	highlight DiffAdd      ctermbg=Blue
	highlight DiffChange   ctermbg=Magenta
	highlight DiffDelete   ctermbg=Cyan
	highlight Pmenu        ctermbg=Magenta
	highlight SpellBad     ctermbg=Red
	highlight SpellCap     ctermbg=Blue
	highlight SpellRare    ctermbg=Magenta
else
	highlight Directory    ctermfg=Cyan
	highlight MoreMsg      ctermfg=Green
	highlight Question     ctermfg=Green
	highlight SpecialKey   ctermfg=Blue
	highlight Title        ctermfg=Magenta
	highlight WarningMsg   ctermfg=Red
endif
