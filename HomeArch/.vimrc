"" =============================================================================
"" + File name:          vimrc
"" + Description:        Vim startup settings
"" =============================================================================
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" Sets languages
set langmenu=en_US

" Sets file codings
set fileencodings=utf-8,gk2312,gbk,gb18030
set termencoding=utf-8
set encoding=utf-8

set fileformat=unix   " Use Unix line endings
set nocompatible      " Use Vim settings, rather then Vi settings (much better!).
set confirm           " Ask to save when we'd just complain usually

" Don't gunk up the filesystem with swap files, and be smart about unsaved buffers
set hidden
set nobackup
set nowritebackup
set noswapfile

" Set command window height to 2 lines, avoids 'press <Enter> to continue' 
" (doesn't really work)
set cmdheight=2

" Syntax highlight
if !exists("syntax_on")
  syntax on
endif

" Disable filetype indent automation
filetype plugin indent on

" Enable markdown syntax for *.md
autocmd BufNewFile,BufRead *.md set filetype=markdown

set history=300         " Sets how many lines of history VIM has to remember
set autoread            " Pick up changes from outside this vim session

" Enable line numbers in printing
:set printoptions=number:y,left:5pc,top:5pc,right:5pc,bottom:5pc
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set color scheme
set t_Co=256
colorscheme desert

" Always show the tab line
set showtabline=2

" Set the maximum number of tabs
set tabpagemax=30

" Set default window size
if has("gui_running")
  winpos 300 100
  set lines=30 columns=150
  " Set GUI fonts
  set guifont=monospace\ 12 
endif

" Scroll boundaries to avoid always being on the edge of the screen
set scrolloff=4

set guicursor=a:blinkon0    " Set no blinking cursor
set number                  " Show line numbers
set wrap                    " No word wrap

set showcmd
set cmdheight=2             " Command line height
set wildmode=full
set wildmenu                " visual autocomplete for command menu
set synmaxcol=200           " Limit column highlights to 200 columns

set nocursorline
highlight CursorLine cterm=NONE ctermbg=236 ctermfg=NONE

" Cool file explorer stuff
let g:netrw_liststyle=3

" Searching
set hlsearch                " Highlight searching results
set incsearch
set showmatch
set ignorecase
set ruler                   " Show the cursor position at the status bar
 
" allow scrolling in insert mode
set mouse=i
" Select with the mouse and press '>' to indent
" set selectmode=key
" Select both with the mouse and shifted arrow keys and press '>' to indent
"set selectmode=

" Clear highlighting when redrawing the screen
nnoremap <C-L> :nohl<CR><C-L>

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10

" Auto leave insert mode after 3 seconds of inactivity, really nice!
autocmd CursorHoldI * stopinsert 
autocmd InsertEnter,InsertLeave * set cul!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mapleader = " "

nnoremap <silent> <leader><Space> :nohl<CR>

" Underline with ='s
nnoremap <silent> <leader>1 ^y$o<ESC>pVr=

" Underline with -'s and indent
nnoremap <silent> <leader>2 ^y$o<ESC>pVr->>

" Re hardwrap a paragraph
nnoremap <silent> <leader>p gqip

" Split the screen vertically and move there
nnoremap <silent> <leader>V <C-w>v<C-w>l

" Split the screen horizontally and move there
nnoremap <silent> <leader>H <C-w>s

" Close window
nnoremap <silent> <leader>q <C-w>q

" Switch windows
nnoremap <silent> <leader>S <C-w><C-w>

" Faster shell commands
noremap :! :!clear;
noremap :make :!clear; make
nnoremap <leader>c :!clear; 

" Quick spell check
nnoremap <silent> <leader>z :set spell!<CR>

" Faster open file in directory
nnoremap <silent> <leader>d :Sex!<CR>

" Faster close buffer
nnoremap <silent> <leader>x :bd<CR>

" Faster open file explorer
nnoremap <silent> <leader>e :Ex<CR>

" Quicker jump to last buffer
nnoremap <silent> <leader>j :w\|b#<CR>

" Quicker switch to relative numbering
nnoremap <silent> <leader>R :set relativenumber!<CR>

" Quicker save the current file
nnoremap <silent> <leader>w :w<CR>

" Insert a blank line below the current line
nnoremap <silent> <leader>o o<Esc>

" Quicker check which files ar open
nnoremap <silent> <leader>l :ls<CR>

" Quicker check which marks are set
nnoremap <silent> <leader>M :marks<CR>

" Quicker make
nnoremap <silent> <leader>m :!clear;make<CR>

" Quicker visual block mode
nnoremap <silent> <leader>v <C-S-v>

" Easier generic command
nnoremap <leader>; :
vnoremap <leader>; :

" Quick substitute
vnoremap <leader>s :s/
nnoremap <leader>s V:s/

" Run the current file based on filetype
function! Compile(compile_command)
  if filereadable("./Makefile") || filereadable("./makefile")
    make
  else
    execute "!" . a:compile_command . " " . bufname("%")
  endif
endfunction

autocmd FileType python  nmap <leader>r :!python %<cr>
autocmd FileType scheme  nmap <leader>r :!racket %<cr>
autocmd FileType sh      nmap <leader>r :!bash %<cr>
autocmd FileType perl    nmap <leader>r :!perl %<cr>
autocmd FileType haskell nmap <leader>r :!runhaskell %<cr>
autocmd FileType java    nmap <leader>r :silent call Compile("javac")<cr> \|:!java %:r<cr>
autocmd FileType c       nmap <leader>r :silent call Compile("gcc")  <cr> \|:!./a.out <cr>

" List macros
nnoremap <leader>? :echo "  : Clear highlighting \n1 : Underline with = \n2 : Underline with - \np : Rewrap a paragraph \n\v : Split the screen vertically \n\h : Split the screen horizontally \nq : Close the current window \nS : Switch windows \nc : Faster command \nz : Quick spell check \nd : Open a new file in a window \nx : Close the current buffer \ne : Open a new file in a new buffer \nj : Jump to the last buffer open \nr : Switch to relative numbering \nw : Save the current file \no : Insert a blank line \nl : Check which files are open\nr : run the current file based on file type"<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Move through columns correctly
nnoremap <silent> j gj
nnoremap <silent> k gk

" Switch buffers with parens
noremap <silent> ( :bp<cr>zz
noremap <silent> ) :bn<cr>zz

" Faster scrolling Down
nnoremap J 5<C-e>5gj
vnoremap J 5<C-e>5gj

nnoremap { 4gj
vnoremap { 4gj

nnoremap <silent> <Down> L5<C-e>5gj

" Map old J to ctrl-j
nnoremap <C-j> J
vnoremap <C-j> J

" Faster scrolling Up
nnoremap K 5<C-y>5gk
vnoremap K 5<C-y>5gk

nnoremap } 4gk
vnoremap } 4gk

nnoremap <silent> <Up> H5<C-y>5gk
"nnoremap <C-k> K
"vnoremap <C-k> K

" Faster repeat last command
nnoremap <silent> <C-@> @@

" Better jump to previous location
nnoremap <silent> <C-o> <C-o>zz

" Mouse
"set mouse=n
"nnoremap <ScrollWheelUp> gk
"nnoremap <S-ScrollWheelUp> Hgk
"nnoremap <ScrollWheelDown> gj
"nnoremap <S-ScrollWheelDown> Lgj

" Faster move to end and start of lines
nnoremap B ^
nnoremap E $
vnoremap B ^
vnoremap E $

" Faster escape?
inoremap jk <Esc>:w<cr>

"nnoremap ; :

" Smarter [Y]anking ? 
map Y y$

" Completion in insert mode with ctrl-Space
" Default pulls from open files, adding the dictionary pulls from there too
set dictionary=/usr/share/dict/words
map <leader>+ :set complete+=k<CR>
map <leader>- :set complete-=k<CR>

"inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"     \ "\<lt>C-n>" :
"     \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"     \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"     \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

inoremap <silent> <Tab> <C-R>=Tab_Or_Complete()<CR>
"imap <C-@> <C-Space>

" Splits
set splitbelow
set splitright

" Horizontal scrolling ?
set scrollopt+=hor
nnoremap <ScrollWheelLeft> :echo HELLO

" Text width. Auto wrap line at n chars
" 88 works better for Pixel
set tw=88

" Quick shell with C-d, go back to vim with C-d too
noremap <C-d> :sh<cr>
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start   " allow backspacing over everything in insert mode
set shiftwidth=2                 " Set 2 spaces for indenting
set tabstop=2                    " Set 2 TAB stops
set softtabstop=2
set expandtab                    " Spaces instead of tabs
set smarttab
set autoindent                   " Set auto indenting on
set smartindent
set nocindent                    " Do not use C language indent style
set showmatch                    " Show matched brackets
