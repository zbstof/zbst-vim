" Vim, not vi
set nocompatible
" Sets the language of the menu (gvim)
set langmenu=en_US.UTF-8
" Sets the language of the messages / ui (Vim)
language messages en
" Remove ALL autocommands for the current group
autocmd!
" Automatically use system clipboard
set clipboard=unnamed
" Disable cursor blinking
set guicursor+=a:blinkon0
" Enable mouse support in console
set mouse=a

" Change Leader key
let mapleader = ","

" Activate Vundle
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins {{{
" The mother of all bundles
Bundle "gmarik/vundle"

Bundle "FuzzyFinder"
" FuzzyFinder mapping - open buffers
nnoremap <Leader>ls :FufBuffer<CR>
" fuf mapping - all files in current directory
nnoremap <Leader>lf :FufCoverageFile<CR>
" fuf mapping - most recently used files
nnoremap <Leader>lr :FufMruFile<CR>
" fuf mapping - open bookmarked files
nnoremap <Leader>lb :FufBookmarkFile<CR>
" fuf mapping - add file to bookmarks
nnoremap <Leader>la :FufBookmarkFileAdd<CR>
" Enable fuf mru mode
let g:fuf_modesDisable = [ 'mrucmd', ]

" Graphical undo
Bundle "sjl/gundo.vim"
nnoremap <F5> :GundoToggle<CR>

Bundle "ervandew/supertab"
" Enable longest common match
let g:SuperTabLongestEnhanced = 1
" Enable context autocomplete
let g:SuperTabDefaultCompletionType = "context"

Bundle "majutsushi/tagbar"
" Map tagbar outline toggle
nnoremap <F8> :TagbarToggle<CR>
" Tagbar configuration
let g:tagbar_usearrows = 1
let g:tagbar_sort = 0

" OpenBrowser - open links under cursor
Bundle "tyru/open-browser.vim"
let g:netrw_nogx = 1 " disable netrw's gx mapping
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

Bundle "kien/ctrlp.vim"
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlPMixed'

Bundle "Lokaltog/vim-powerline"
" Use short path name
let g:Powerline_stl_path_style = 'short'
call Pl#Theme#RemoveSegment('fugitive:branch')

" Kill buffer preserving window:
" ,(!)bd - kill buffer
Bundle "bufkill.vim"
" Some quick switching
nnoremap <C-Tab> :BB<CR>
nnoremap <C-S-Tab> :BF<CR>

" Expore hex view of file with ,hm
"Bundle 'hexman.vim'

Bundle "scrooloose/syntastic"
"
" Comment out lines with ,cs
" Toggle comments with ,ci
Bundle "scrooloose/nerdcommenter"

" Explore filesystem with :NERDTreeToggle
Bundle "scrooloose/nerdtree"

Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-unimpaired"
Bundle "Kris2k/matchit"
Bundle "Rip-Rip/clang_complete"
Bundle "bronson/vim-visual-star-search"

" Manipulate gists:
" create - :Gist
Bundle "mattn/gist-vim"

Bundle "mileszs/ack.vim"
Bundle "Townk/vim-autoclose"

" Filetype-specific plugins
Bundle "PProvost/vim-ps1"
Bundle "othree/html5.vim"
Bundle "derekwyatt/vim-scala"
Bundle "klen/python-mode"
Bundle "xml.vim"

" Color schemes
Bundle "altercation/vim-colors-solarized"

" Support bundles
Bundle "mattn/webapi-vim"
Bundle "L9"

"}}}

" Change default directory
cd ~\Scripts\
" Manual folding (zf)
set foldmethod=marker

" Set correct Unicode processing
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8              "better default than latin1
    setglobal fileencoding=utf-8    "change default file encoding when writing new files
    set fileencodings=utf8,uft-16le,cp1251
endif

" Set switching language on <C-^>
set keymap=ukrainian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Green

" Use more prompt
set more
" Watch for file changes
set autoread
" Hide buffers when they are abandoned
set hidden
" Show current mode
set showmode

" Show (partial) command in status line
set showcmd
" Keep at least several lines above/below
set scrolloff=2
" Keep at least several lines left/right
set sidescrolloff=5

" Make sure backspace is unstoppable
set backspace=indent,eol,start
" 1000 undos
set undolevels=1000
" Remember history
set history=200

" Enable syntax highlighting
syntax on
" Enable filetype detection
filetype on
" Enable filetype-specific indenting
filetype indent on
" Enable filetype-specific plugins
filetype plugin on

" {{{ GUI CLEANUP
" Makes gui the way I like it
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

" Maximize window on start
autocmd GUIEnter * simalt ~x

" }}}
"{{{ AUTO-COMPLETION

" Enable omni-completion
set omnifunc=syntaxcomplete#Complete
" Complete longest common string, list alternatives
set wildmode=longest,list
" Menu has tab completion
set wildmenu
" Don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window
" Don't care about binary/temporary files
set wildignore=*.swp,*.pyo,*.pyc,*.class
set wildignore+=*.o,*.obj,.git

" }}}
"{{{ SEARCHING

" Incremental search
set incsearch
" Search ignoring case
set ignorecase
" Highlight the search
set hlsearch
" Show matching bracket
set showmatch
" Sane regexes
" nnoremap / /\v
" vnoremap / /\v
" Match capital and not-capital letters alike
set smartcase
" Set substitute search to replace all ocurrences by default
set gdefault

" Ignore all whitespace and sync
set diffopt=filler,iwhite

" }}}
"{{{ BACKUP

" Set fixed backup/swap/undo directory
" set backupdir=$VIM/backup
set nobackup
set nowritebackup
" set directory=$VIM/swap
set noswapfile
set undodir=$VIM/undo
set undofile

" }}}
"{{{ COMMON MISSPELLINGS

abbr teh the

" }}}
"{{{ INDENTATION

" Spaces are inserted instead of tabs
set expandtab
" Tab in front of a line inserts 'shiftwidth' blanks
set smarttab
" Number of spaces for indent
set shiftwidth=4
" For how many spaces Tabs in file count
set tabstop=4
" Copy indent from current line when starting a new line
set autoindent
" Indent is automatically inserted in functions' {/}
set smartindent

" Add jspf syntax
autocmd BufNewFile,BufRead *.jspf set filetype=jsp
" Also .tag files
autocmd BufNewFile,BufRead *.tag set filetype=jsp

" Spell-checker - ftp://ftp.vim.org/pub/vim/runtime/spell/
set spelllang=en,ru_ru,uk

" Split words on punctuation with word-wrap
set linebreak

" Highlight line under cursor
set cursorline


" }}}
"{{{ QUICK EDITS

" Edit vimrc in current buffer
nnoremap <Leader>v :edit $VIM/.vimrc<CR>
" Edit hosts file (should run under Admin)
nnoremap <Leader>h :edit C:/Windows/System32/drivers/etc/hosts<CR>
" Edit my personal notes file
nnoremap <Leader>n :edit $Dropbox/Notes.txt<CR>

" Change path to current directory
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
" Get current filename (head) in clipboard
nnoremap <Leader>ff :let @*=expand("%:t")<CR>
" Get full path in clipboard
nnoremap <Leader>fp :let @*=expand("%:p")<CR>
" Get directory of file (tail) in clipboard
nnoremap <Leader>fd :let @*=expand("%:h")<CR>
" Reload vimrc file
nnoremap <Leader>m :source $VIM/.vimrc<CR>

" }}}
"{{{ MAPPINGS

" Toggle line numbers
nnoremap <F11> :set invnumber<CR>
" Toggle line-wrap
nnoremap <F12> :set wrap!<CR>
" Toggle spelling
nnoremap <F7> :set spell!<CR>
inoremap <F7> <C-o>:set spell!<CR>
" Toggle list mode - shows hidden characters
nnoremap <F9> :set list!<CR>
" Space will toggle folds!
" nnoremap <Space> za
" Set mapping for highlighting toggle
nnoremap <Leader><Space> :nohlsearch<CR>
" Substitute all occurrences of the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
" Trim whitespace
nnoremap <Leader>W :%s/\s\+$//<CR>
" Change encoding to utf-16le (for log files)
nnoremap <Leader>log :e ++enc=utf-16le<CR>
" Search pharase under selection
" vnoremap * y/<C-R>*<CR>N
" Count expression under search
nnoremap <Leader>z :%s///n<CR>

" Up and down are more logical with g - wrapped lines count
nnoremap k gk
nnoremap j gj
" Create Blank Newlines and stay in Normal mode
nnoremap zj o<Esc>
nnoremap zk O<Esc>
" Center on next match
nnoremap N Nzz
nnoremap n nzz
" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Easy window movement
noremap <Leader>wj <C-w><S-j>
noremap <Leader>wh <C-w><S-h>
noremap <Leader>wk <C-w><S-k>
noremap <Leader>wl <C-w><S-l>
" Make * just highlight current word
nnoremap * *N
" Swap ; and : in Normal mode
" nnoremap ; :
" nnoremap : ;
" Make delete inner word also delete space after it
nmap diw hebdw

" Disable some mappings
" F1 for help; :help is more useful
nnoremap <F1> <nop>
" Q to start ex mode; intended to start recording a macro with q
nnoremap Q <nop>
" Disable K to bring up a man page for the word under the cursor
nnoremap K <nop>
" Consistent yanking
nnoremap Y y$

" Mapping to copy contents of the buffer to clipboard
nnoremap <Leader>ya :%y*<CR>
" Mapping to replace contents of the buffer with clipboard's
nnoremap <Leader>yp ggVG"_dP<CR>
" }}}
"{{{ PLUGIN CONFIGURATION

" Javascript indent configuration for html.vim
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" }}}
"{{{ MISC

" Set off the other paren
highlight MatchParen ctermbg=4

" Always have status line in last window
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set fileformats=unix,dos,mac        " Try recognizing dos, unix, and mac line endings

" Authomatic foling for xml files
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
au FileType jsp setlocal foldmethod=syntax
" }}}
