" https://github.com/kchmck/vim-coffee-script/issues/127
setlocal nosmartindent

map <F5> :call VimuxRunCommand("coffee " . bufname("%"))<CR>
