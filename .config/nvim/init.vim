set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

set laststatus=1

" https://github.com/neovim/neovim/blob/e75e9c10dc947bc4aac0aea927e47038bf984b7f/src/nvim/syntax.c#L5888
if &background ==# "light"
	highlight ColorColumn ctermbg=Red guibg=Red
	highlight DiffAdd ctermbg=Blue guibg=Blue
	highlight DiffChange ctermbg=Magenta guibg=Magenta
	highlight DiffDelete ctermbg=Cyan ctermfg=Blue gui=bold guifg=Blue guibg=Cyan
	highlight Pmenu ctermbg=Magenta ctermfg=Black guibg=Magenta
	highlight SpellBad ctermbg=Red guisp=Red gui=undercurl
	highlight SpellCap ctermbg=Blue guisp=Blue gui=undercurl
	highlight SpellRare ctermbg=Magenta guisp=Magenta gui=undercurl
else
	highlight Directory ctermfg=Cyan guifg=Cyan
	highlight MoreMsg ctermfg=Green gui=bold guifg=SeaGreen
	highlight Question ctermfg=Green gui=bold guifg=Green
	highlight SpecialKey ctermfg=Blue guifg=Cyan
	highlight Title ctermfg=Magenta gui=bold guifg=Magenta
	highlight WarningMsg ctermfg=Red guifg=Red
endif
