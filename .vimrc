"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Menlo:h14
set history=700
set number

" Set to auto read when a file is changed from the outside
set autoread


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Show command in bar, i.e. leader
set showcmd

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2 
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

let g:jellybeans_use_lowcolor_black = 0
colors jellybeans

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set undofile
set undoreload=10000


set undodir=~/.vim/tmp/undo//     " undo files
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set listchars=tab:>-,trail:·,extends:>,precedes:<
set list
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

if has('vim_starting')
if &compatible
 set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


" Plugins {{{
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \    },
      \ }

" Layout
NeoBundleLazy "groenewege/vim-less",  {'autoload':{'filetypes':['less']}}
NeoBundleLazy "digitaltoad/vim-jade",  {'autoload':{'filetypes':['jade']}}
NeoBundleLazy "ap/vim-css-color", {'autoload':{'filetypes':['css','sass','less']}}
NeoBundleLazy "wavded/vim-stylus", {'autoload':{'filetypes':['styl']}}
NeoBundleLazy "fatih/vim-go.git", {'autoload':{'filetypes':['go']}}
NeoBundleLazy "kchmck/vim-coffee-script", {'autoload':{'filetypes':['coffee']}}
NeoBundle "ntpeters/vim-better-whitespace"
NeoBundle "airblade/vim-gitgutter"
NeoBundleLazy "luochen1990/rainbow", {'autoload':{'filetypes':['clojure','lisp','javascript','vim']}}
NeoBundle "nathanaelkane/vim-indent-guides"

" Navigation
NeoBundle "Shougo/tabpagebuffer.vim"
NeoBundle "Shougo/vimfiler.vim"
NeoBundle 'Shougo/unite.vim'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'christoomey/vim-tmux-navigator'

" Completion
NeoBundle "Shougo/neocomplete.vim"
NeoBundle "tpope/vim-repeat"
NeoBundle "junegunn/vim-peekaboo"

"Macro
NeoBundle "junegunn/vim-easy-align"
NeoBundle "scrooloose/nerdcommenter"
NeoBundle "tpope/vim-unimpaired"
NeoBundle "Shougo/neosnippet.vim"
NeoBundle "tpope/vim-surround"
NeoBundle "tommcdo/vim-exchange"
NeoBundle "AndrewRadev/switch.vim"
NeoBundle "AndrewRadev/splitjoin.vim"
NeoBundleLazy "dlau/vim-jsdoc", {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy "mattn/emmet-vim", {'autoload':{'filetypes':['html', 'jsx', 'javascript', 'coffee']}}

" Checkers
"NeoBundle "scrooloose/syntastic"
NeoBundle "neomake/neomake"

"Text Objects
NeoBundle "michaeljsmith/vim-indent-object"

"Tool
NeoBundle "tpope/vim-fugitive"
NeoBundleLazy "pangloss/vim-javascript", {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy "tpope/vim-leiningen", {'autoload':{'filetypes':['clojure']}}
NeoBundleLazy "tpope/vim-projectionist", {'autoload':{'filetypes':['clojure']}}
"NeoBundleLazy "tpope/vim-fireplace", {'autoload':{'filetypes':['clojure']}}
NeoBundleLazy "elixir-lang/vim-elixir" , {'autoload':{'filetypes':['elixir']}}
NeoBundleLazy "slashmili/alchemist.vim" , {'autoload':{'filetypes':['elixir']}}

NeoBundle "sjl/gundo.vim/"
NeoBundle "benmills/vimux"

call neobundle#end()

filetype plugin indent on     " Required!

NeoBundleCheck


set backspace=eol,start,indent         " backspace in insert mode works like normal editor

let g:Powerline_symbols = 'fancy'

set colorcolumn=80

"Vim switch
nnoremap - :Switch<CR>

"Emmet
noremap <C-l> <NOP>
let g:user_emmet_leader_key='<C-l>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\ 'html' : {
\     'block_all_childless' : 1,
\     'block_elements' : 'div select input span',
\   }
\}

"JSDoc
"nmap -- :JsDoc <cr>

"Syntastic Config

let g:syntastic_python_checkers=['flake8']
let g:syntastic_javascript_checkers=['eslint']

"Neomake conifg
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
"Lint on write
autocmd! BufWritePost * Neomake

"Neosnippet config
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '~/.vim/snippets/'
imap <expr><C-]> (pumvisible() ? "\<C-y>":"")."\<Plug>(neosnippet_expand_or_jump)"
nmap <expr><C-]> (pumvisible() ? "\<C-y>":"")."\<Plug>(neosnippet_expand_or_jump)"

"Unite.vim plugin configuration

"TODO: Make project specific
"Greppers
if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
    let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
    let g:unite_source_grep_recursive_opt = ''
endif

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#profile('default', 'context', { 'cursor_line_highlight' : 'PmenuSel' })


let g:unite_source_rec_async_command= 'ag --nocolor --nogroup --hidden -g ""'

call unite#custom#source(
    \ 'file_rec/async,grep',
    \ 'ignore_pattern',
    \ join(['^cache\/','^\.\S*/','\/\.\S*/','\.git/', 'node_modules/', 'assets/images', 'assets/addons'], '\|')
\)
call unite#custom#source(
    \ 'buffer,file,file_rec,grep',
    \ 'sorters', [])

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

let g:unite_source_file_rec_max_cache_files = 0
call unite#custom#source('file_rec,file_rec/async,grepocate',
        \ 'max_candidates', 25)


function! s:unite_settings()
    nmap <buffer> Q <plug>(unite_exit)
    nmap <buffer> <esc> <plug>(unite_exit)
    imap <buffer> <esc> <plug>(unite_exit)
endfunction

let g:unite_source_history_yank_enable = 1

nnoremap <leader>f :<C-u>Unite -auto-resize -start-insert file_rec/async:!<cr>
nnoremap <leader>b :<C-u>Unite -auto-resize -buffer-name=buffers  buffer_tab<cr>
nnoremap <leader>y :<C-u>Unite history/yank<cr>

nnoremap <leader>g :<C-u>Unite -horizontal -no-quit -buffer-name=grepbuffer grep:.<cr>

let g:unite_source_menu_menus = {}

"Disable Auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Toggle comment off/on

noremap <C-\>  :VimFilerExplorer<cr>
map <F1> <plug>NERDCommenterToggle

"Neocomplete
let g:neocomplete#enable_auto_select = 1
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:tern#is_show_argument_hints_enabled = 1
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#cancel_popup() . "\<CR>"
  "" For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
  endif
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType javascript let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" File jumping in javascript
autocmd FileType javascript setlocal suffixesadd+=.js

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

"Incremental search overrides
nmap /  <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)


"Do not use smartindent for non curly braced languages
au! FileType python setl nosmartindent
au! FileType jade setl nosmartindent

function! AddEmptyLineBelow()
  call append(line("."), "")
endfunction

function! AddEmptyLineAbove()
  let l:scrolloffsave = &scrolloff
  " Avoid jerky scrolling with ^E at top of window
  set scrolloff=0
  call append(line(".") - 1, "")
  if winline() != winheight(0)
    silent normal! <C-e>
  end
  let &scrolloff = l:scrolloffsave
endfunction

function! DelEmptyLineBelow()
  if line(".") == line("$")
    return
  end
  let l:line = getline(line(".") + 1)
  if l:line =~ '^\s*$'
    let l:colsave = col(".")
    .+1d
    ''
    call cursor(line("."), l:colsave)
  end
endfunction

function! DelEmptyLineAbove()
  if line(".") == 1
    return
  end
  let l:line = getline(line(".") - 1)
  if l:line =~ '^\s*$'
    let l:colsave = col(".")
    .-1d
    silent normal! <C-y>
    call cursor(line("."), l:colsave)
  end
endfunction

noremap <silent> <C-o> :call AddEmptyLineAbove()<CR>
noremap <silent> <C-l> :call AddEmptyLineBelow()<CR>

" Plugin specific variables

let g:cssColorVimDoNotMessMyUpdatetime = 1
let javascript_enable_domhtmlcss = 1
let g:indent_guides_enable_on_vim_startup=1
au FileType coffee,python,ruby IndentGuidesEnable
let g:session_autosave='no'
let g:session_autoload='no'
set ssop-=options    " do not store global and local values in a session

" Enable rainbow parens by default
let g:rainbow_active = 1

" Delay opening of peekaboo window (in ms. default: 0)
let g:peekaboo_delay = 500

" Compact display; do not display the names of the register groups
let g:peekaboo_compact = 1

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)


" Utility remaps
imap jk <Esc>
imap Jk <Esc>
imap JK <Esc>
nmap ` :nohl<CR>
nnoremap t :tabnext<CR>
nnoremap T :tabprevious<CR>
nnoremap <C-t> :tabnew<CR>

imap <expr><C-]> (pumvisible() ? "\<C-y>":"")."\<Plug>(neosnippet_expand_or_jump)"

set cursorline

set tabstop=2
set shiftwidth=2

nmap <C-u> :GundoToggle<CR>

set mouse=a

" Tmux navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

map <F6> :call VimuxRunLastCommand()<CR>

