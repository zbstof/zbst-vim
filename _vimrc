"vim, not vi
set nocompatible
"sets the language of the menu (gvim)
set langmenu=en_US.UTF-8
"sets the language of the messages / ui (vim)
language messages en

"Remove ALL autocommands for the current group.
autocmd!
"automatically use system clipboard
set clipboard=unnamed
"Change Leader key
let mapleader = ","
"Activate Pathogen
source $VIM/vimfiles/bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"Set correct Unicode processing
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8              "better default than latin1
  setglobal fileencoding=utf-8    "change default file encoding when writing new files
endif

"Handle different keyboard languages in Normal mode (mappings do not work):
set langmap=ё`,йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж;;,э\',яz,чx,сc,мv,иb,тn,ьm,ю.,Ё~,ЙQ,ЦW,УE,КR,ЕT,HY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,іs,ІS,є',Є\",ї],Ї},ж:,Ж;;,

"Maximize window on start
au GUIEnter * simalt ~x

"enable syntax highlighting
syntax on
"use more prompt
set more
"watch for file changes
set autoread
"Hide buffers when they are abandoned
set hidden
"don't automagically write on :next
"set noautowrite
"Show current mode
set showmode

"Show (partial) command in status line
set showcmd
"And so is Artificial Intellegence!
set smartcase
"Set substitute search to replace all ocurrences by default
set gdefault
"keep at least 5 lines above/below
set scrolloff=2
"keep at least 5 lines left/right
set sidescrolloff=5
set history=200

"Make sure backspace is unstoppable
set backspace=indent,eol,start
"1000 undos
set undolevels=1000
"switch every 100 chars
set updatecount=100

"Enable filetype detection
filetype on
"Enable filetype-specific indenting
filetype indent on
"Enable filetype-specific plugins
filetype plugin on

"Enable omni-completion
set ofu=syntaxcomplete#Complete
"Complete longest common string, list alternatives
set wildmode=longest,list
"menu has tab completion
set wildmenu
"Always have status line in last window
"set laststatus=2

" searching
"incremental search
set incsearch
"search ignoring case
set ignorecase
"highlight the search
set hlsearch
"show matching bracket
set showmatch
"ignore all whitespace and sync
set diffopt=filler,iwhite

" backup
"Set fixed backup/swap/undo directory
set backupdir=$VIM\\backup
set nobackup
set directory=$VIM\\swap
set noswapfile
set undodir=$VIM\\undo
set undofile

"mappings
"toggle list mode - shows hidden characters
nnoremap <F9> :set list!<CR>

"change directory to match opened file
"set autochdir
"substitute all occurrences of the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"Common misspelling
abbr teh the

"Spaces are inserted instead of tabs
set expandtab
"Tab in front of a line inserts 'shiftwidth' blanks
set smarttab
" Number of spaces for indent
set shiftwidth=4
"Number of spaces that a <Tab> counts for while performing editing
set softtabstop=4
"For how many spaces Tabs in file count
set tabstop=4
"Copy indent from current line when starting a new line
set autoindent
"Indent is automatically inserted in functions' {/}
set smartindent

"Enable mouse support in console
set mouse=a

"Remap jj to escape in insert mode
inoremap jj <Esc>

"Set off the other paren
highlight MatchParen ctermbg=4

"Favorite Color Scheme
if has("gui_running")
   colorscheme zenburn

   "Muck with gvim interface
   "remove toolbar
   set guioptions-=T
   "Remove right scrollbar
   set guioptions-=r
   set guioptions-=R
   "remove left scrollbar
   set guioptions-=l
   set guioptions-=L
   "remove menu bar
   set guioptions-=m

   "Consolas is AWESOME
   set guifont=Consolas:h11
endif

"Always have status line in last window
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

"Up and down are more logical with g - wrapped lines count
nnoremap <silent> k gk
nnoremap <silent> j gj

"Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

"Space will toggle folds!
nnoremap <space> za

"Search mappings: These will make it so that going to the next one in a
"search will center on the line it's found in.
noremap N Nzz
noremap n nzz

"Add jspf syntax
au BufNewFile,BufRead *.jspf set filetype=jsp
"Also .tag files
au BufNewFile,BufRead *.tag set filetype=jsp

"Spell-checker - ftp://ftp.vim.org/pub/vim/runtime/spell/
set spelllang=en,ru,uk
noremap <F7> :set spell!<CR>
inoremap <F7> <C-o>:set spell!<CR>

"Mapping to comment current line
nmap <C-c> <Plug>Traditionalgj
imap <C-c> <Esc><Plug>Traditionalgji

"get help to open in new buffer to the right
"cmap vhelp vertical botright help
"toggle line-wrap
noremap <F12> :set wrap!<CR>
"split words on punctuation with word-wrap
set linebreak
"don't care about binary/temporary files
set wildignore=*.swp,*.bak,*.pyc,*.class
"trim whitespace
nnoremap <leader>W :%s/\s\+$//<CR>
"Enter 'Paste' mode
"set pastetoggle=<F2>

"Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"Highlight line under cursor
set cursorline
"Show relative instead of absolute line number
"set relativenumber
"Fix regex in search to be standard
"nnoremap / /\v
"vnoremap / /\v
"Set mapping for highlighting toggle
nnoremap <leader><space> :nohlsearch<CR>

"Save on losing focus
"au FocusLost * silent! wa
"Open new vertical split and switch to it
nnoremap <leader>w <C-w>v<C-w>l
"Disable cursor blinking
set guicursor+=a:blinkon0

"Quick edits:

"shortcut for editing vimrc file in new vertical split
"nnoremap <leader>v <C-w><C-v><C-l>:e $MYVIMRC<CR>
"Edit vimrc in current buffer
nnoremap <Leader>v :edit $MYVIMRC<CR>
"edit hosts file (should run under Admin)
nnoremap <Leader>h :edit C:\Windows\System32\drivers\etc\hosts<CR>
"edit my personal notes file
nnoremap <Leader>n :edit ~\Notes.txt<CR>

"noremap change path to current directory
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
"helpful to load a bunch of files in buffers form current path
"cabbrev <Leader>a args **/*.<BS>

"Get current filename (head) in clipboard
nnoremap <Leader>ff :let @*=expand("%:t")<CR>
"Get full path in clipboard
nnoremap <Leader>fp :let @*=expand("%:p")<CR>
"Get directory of file (tail) in clipboard
nnoremap <Leader>fd :let @*=expand("%:h")<CR>

"Intelligently delete buffer
"source $VIM\bdel.vim
nmap <C-W>! <Plug>Kwbd

"Reload vimrc file
nnoremap <Leader>r :source $MYVIMRC<CR>

"Some quick switching
nnoremap <C-Tab> :b#<CR>

"FuzzyFinder mapping
nnoremap <Leader>ls :FufBuffer<CR>
nnoremap <Leader>lf :FufCoverageFile<CR>
let g:fuf_modesDisable = [ 'mrucmd', ]
nnoremap <Leader>lr :FufMruFile<CR>

"Make Ctrl+Backspace delete previous word in Insert mode
imap <C-BS> <C-W>
"Toggle line numbers
nnoremap <F11> :set invnumber<CR>
"Manual folding (zf)
set foldmethod=manual
"Change default directory
cd ~
"Set <C-a> to "Select All"
nnoremap <C-a> ggVG

"Make * just highlight current word
nnoremap * *N

"Swap ; and : in Normal mode
nnoremap ; :
nnoremap : ;
"Enable longest common match
let g:SuperTabLongestEnhanced = 1
"Enable context autocomplete
let g:SuperTabDefaultCompletionType = "context"


"Map graphical undo toggle
nnoremap <F5> :GundoToggle<CR>
"Tagbar configuration
let g:tagbar_usearrows = 1
nnoremap <F8> :TagbarToggle<CR>
