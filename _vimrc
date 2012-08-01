"Vim, not vi
set nocompatible
"sets the language of the menu (gvim)
set langmenu=en_US.UTF-8
"sets the language of the messages / ui (Vim)
language messages en
"Remove ALL autocommands for the current group.
autocmd!
"automatically use system clipboard
set clipboard=unnamed
"Disable cursor blinking
set guicursor+=a:blinkon0
"Enable mouse support in console
set mouse=a

"Activate Pathogen
source $VIM/bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect('$VIM/bundle')

"Change Leader key
let mapleader = ","
"Change default directory
cd ~
"Manual folding (zf)
set foldmethod=manual

"Set correct Unicode processing
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8              "better default than latin1
    setglobal fileencoding=utf-8    "change default file encoding when writing new files
    set fileencodings=utf8,uft-16le,cp1251
endif

"Makes gui the way I like it
if has("gui_running")
    "colorscheme zenburn

    set background=dark
    colorscheme solarized
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
    set guifont=Consolas:h10
endif

"Set switching language on <C-^>
set keymap=ukrainian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

"Maximize window on start
autocmd GUIEnter * simalt ~x

"enable syntax highlighting
syntax on
"use more prompt
set more
"watch for file changes
set autoread
"Hide buffers when they are abandoned
set hidden
"Show current mode
set showmode

"Show (partial) command in status line
set showcmd
"keep at least several lines above/below
set scrolloff=2
"keep at least several lines left/right
set sidescrolloff=5

"Make sure backspace is unstoppable
set backspace=indent,eol,start
"1000 undos
set undolevels=1000
"switch every 100 chars
set updatecount=100
"remember history
set history=200

"Enable filetype detection
filetype on
"Enable filetype-specific indenting
filetype indent on
"Enable filetype-specific plugins
filetype plugin on

" AUTO-COMPLETION

"Enable omni-completion
set omnifunc=syntaxcomplete#Complete
"Complete longest common string, list alternatives
set wildmode=longest,list
"menu has tab completion
set wildmenu
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window
"don't care about binary/temporary files
set wildignore=*.swp,*.pyo,*.pyc,*.class
set wildignore+=*.o,*.obj,.git
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

" SEARCHING

"incremental search
set incsearch
"search ignoring case
set ignorecase
"highlight the search
set hlsearch
"show matching bracket
set showmatch
" sane regexes
"nnoremap / /\v
"vnoremap / /\v
"Match capital and not-capital letters alike
set smartcase
"Set substitute search to replace all ocurrences by default
set gdefault

"ignore all whitespace and sync
set diffopt=filler,iwhite

" BACKUP

"Set fixed backup/swap/undo directory
"set backupdir=$VIM\\backup
set nobackup
set nowritebackup
"set directory=$VIM\\swap
set noswapfile
set undodir=$VIM\\undo
set undofile

" COMMON MISSPELLINGS

abbr teh the

" INDENTATION

"Spaces are inserted instead of tabs
set expandtab
"Tab in front of a line inserts 'shiftwidth' blanks
set smarttab
"Number of spaces for indent
set shiftwidth=4
"For how many spaces Tabs in file count
set tabstop=4
"Copy indent from current line when starting a new line
set autoindent
"Indent is automatically inserted in functions' {/}
set smartindent

"Add jspf syntax
autocmd BufNewFile,BufRead *.jspf set filetype=jsp
"Also .tag files
autocmd BufNewFile,BufRead *.tag set filetype=jsp

"Spell-checker - ftp://ftp.vim.org/pub/vim/runtime/spell/
set spelllang=en,ru_ru,uk

"split words on punctuation with word-wrap
set linebreak

"Highlight line under cursor
set cursorline
"Show relative instead of absolute line number
"set relativenumber


" QUICK EDITS

"Edit vimrc in current buffer
nnoremap <Leader>v :edit $MYVIMRC<CR>
"edit hosts file (should run under Admin)
nnoremap <Leader>h :edit C:\Windows\System32\drivers\etc\hosts<CR>
"edit my personal notes file
nnoremap <Leader>n :edit $Dropbox\Notes.txt<CR>

"change path to current directory
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
"Get current filename (head) in clipboard
nnoremap <Leader>ff :let @*=expand("%:t")<CR>
"Get full path in clipboard
nnoremap <Leader>fp :let @*=expand("%:p")<CR>
"Get directory of file (tail) in clipboard
nnoremap <Leader>fd :let @*=expand("%:h")<CR>
"Reload vimrc file
nnoremap <Leader>m :source $MYVIMRC<CR>

" MAPPINGS

"Toggle line numbers
nnoremap <F11> :set invnumber<CR>
"Map annoying ex-mode to visual block
nnoremap Q <C-q>
"toggle line-wrap
nnoremap <F12> :set wrap!<CR>
"Toggle spelling
nnoremap <F7> :set spell!<CR>
inoremap <F7> <C-o>:set spell!<CR>
"toggle list mode - shows hidden characters
nnoremap <F9> :set list!<CR>
"Space will toggle folds!
"nnoremap <Space> za
"Set mapping for highlighting toggle
nnoremap <Leader><Space> :nohlsearch<CR>
"substitute all occurrences of the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
"trim whitespace
nnoremap <Leader>W :%s/\s\+$//<CR>
"Change encoding to utf-16le (for log files)
nnoremap <Leader>log :e ++enc=utf-16le<CR>
"Search pharase under selection
vnoremap * y/<C-R>*<CR>N

"Up and down are more logical with g - wrapped lines count
nnoremap k gk
nnoremap j gj
"Create Blank Newlines and stay in Normal mode
nnoremap zj o<Esc>
nnoremap zk O<Esc>
"Center on next match
nnoremap N Nzz
nnoremap n nzz
"Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
"Make * just highlight current word
nnoremap * *N
"Swap ; and : in Normal mode
nnoremap ; :
nnoremap : ;
"Make delete inner word also delete space after it
nmap diw bdw

" WINDOWS-LIKE BEHAVIOR

"Make Ctrl+Backspace delete previous word in Insert mode
inoremap <C-BS> <C-W>
"Set <C-a> to "Select All"
nnoremap <C-a> ggVG
"Some quick switching
nnoremap <C-Tab> :b#<CR>

" PLUGIN CONFIGURATION

"Enable fuf mru mode
let g:fuf_modesDisable = [ 'mrucmd', ]
"Enable longest common match
let g:SuperTabLongestEnhanced = 1
"Enable context autocomplete
let g:SuperTabDefaultCompletionType = "context"
"Tagbar configuration
let g:tagbar_usearrows = 1
let g:tagbar_sort = 0
"Set path to Exuberant cTags
"set g:tagbar_ctags_bin =
"Javascript indent configuration
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
"Add fancy symbols in status line (need --with-features=big)
"let g:Powerline_symbols = 'fancy'

" PLUGIN MAPPINGS

"Map graphical undo toggle
nnoremap <F5> :GundoToggle<CR>
"Map tagbar outline toggle
nnoremap <F8> :TagbarToggle<CR>
"FuzzyFinder mapping - open buffers
nnoremap <Leader>ls :FufBuffer<CR>
"fuf mapping - all files in current directory
nnoremap <Leader>lf :FufCoverageFile<CR>
"fuf mapping - most recently used files
nnoremap <Leader>lr :FufMruFile<CR>
"fuf mapping - open bookmarked files
nnoremap <Leader>lb :FufBookmarkFile<CR>
"fuf mapping - add file to bookmarks
nnoremap <Leader>la :FufBookmarkFileAdd<CR>

"YankRing
let g:yankring_replace_n_pkey = '<Leader>['
let g:yankring_replace_n_nkey = '<Leader>]'
nnoremap <Leader>y :YRShow<CR>

" MISC

"Set off the other paren
highlight MatchParen ctermbg=4

"Always have status line in last window
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set fileformats=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

" PYTHON

au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" OpenBrowser

let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
