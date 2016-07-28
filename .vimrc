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
autocmd BufNewFile,BufRead *.txt set noautoindent


set history=300         " Sets how many lines of history VIM has to remember
set autoread            " Pick up changes from outside this vim session
"set shellcmdflag=-ic    " Set shell to interactive, for colors!

" Enable line numbers in printing
:set printoptions=number:y,left:5pc,top:5pc,right:5pc,bottom:5pc

" Magic for alt keys to work?
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

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
set cmdheight=1             " Command line height
set wildmode=full
set wildmenu                " visual auto complete for command menu
set wildignore=*.o,*~,*.pyc,*.class,*.bak
set wildignore+=.git\*,.svn\* 
set synmaxcol=200           " Limit column highlights to 200 columns
set lazyredraw              " Dont' redraw while excuting macros

set cursorline
highlight CursorLine cterm=NONE ctermbg=236 ctermfg=NONE

" Searching
set hlsearch                " Highlight searching results
set incsearch
set showmatch
set ignorecase
set ruler                   " Show the cursor position at the status bar
 
" mouse!
"function! ToggleMouse()
"    " check if mouse is enabled
"    if &mouse == 'a'
"        " disable mouse
"        set mouse=
"        echo "Mouse disabled"
"    else
"        " enable mouse everywhere
"        set mouse=a
"        echo "Mouse enabled"
"    endif
"endfunc
"map <silent> <leader>b :call ToggleMouse()<cr>
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
set mouse=a

" Clear highlighting when redrawing the screen
nnoremap <C-L> :nohl<CR><C-L>

" Folding
set foldtext=MyFoldText()
function! MyFoldText()
  let nucolwidth = &fdc + &number*&numberwidth
  let winwd = winwidth(0) - nucolwidth - 5
  let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
  let prefix = " >>> "
  let fdnfo = prefix . string(v:foldlevel) . "," . string(foldlinecount)
  let line =  strpart(getline(v:foldstart), 0 , winwd - len(fdnfo))
  let fillcharcount = winwd - len(line) - len(fdnfo)
  return line . repeat(" ",fillcharcount) . fdnfo
endfunction
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2
set foldcolumn=1

" Auto leave insert mode after 3 seconds of inactivity, really nice?
"autocmd CursorHoldI * stopinsert 
"autocmd InsertEnter,InsertLeave * set cul!

" Cool file explorer stuff
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            let cur_win_nr = winnr()
            exec expl_win_num . 'wincmd w'
            close
            exec cur_win_nr . 'wincmd w'
            unlet t:expl_buf_num
        else
            unlet t:expl_buf_num
        endif
    else
        exec '1wincmd w'
        Vexplore .
        let t:expl_buf_num = bufnr("%")
    endif
endfunction
nnoremap <silent> <leader>d :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of browser
let g:netrw_browse_split = 4            " open files in new tab
let g:netrow_altv = 1
let g:netrw_winsize = -28               " thinner width
let g:netrw_sort_sequence = '[\/]$,*'   " directories first
let g:netrw_banner = 0                  " hide the help info
let g:netrw_liststyle = 3               " tree mode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mapleader = " "

" faster clear highlighting
nnoremap <silent> <leader><Space> :nohl<CR>

" faster open vimrc
nnoremap <silent> <leader>u :e $MYVIMRC<cr>

" Underline with ='s
nnoremap <silent> <leader>1 ^y$o<ESC>pVr=

" Underline with -'s and indent
nnoremap <silent> <leader>2 ^y$o<ESC>pVr->>

" Re hardwrap a paragraph
nnoremap <silent> <leader>p gqip

" Toggle paste mode
nnoremap <leader>P :setlocal paste!<cr>:set paste?<cr>

" Split the screen vertically and move there
nnoremap <silent> <leader>V <C-w>v<C-w>l

" Split the screen horizontally and move there
nnoremap <silent> <leader>H <C-w>s

" Close window
nnoremap <silent> <leader>q <C-w>q

" Switch windows
nnoremap <silent> <leader>S <C-w><C-w>
nnoremap <silent> <leader>n <C-w><C-w>

" Faster shell commands
noremap :! :!clear;
noremap :make :!clear; make
nnoremap <leader>c :!clear; 

" Quick spell check
nnoremap <silent> <leader>Z :set spell!<CR>

" faster toggle fold
nnoremap <silent> <leader>z za

" Faster close buffer
nnoremap <silent> <leader>x :bp<bar>sp<bar>bn<bar>bd<CR>

" Faster open file in new buffer
nnoremap <leader>E :e 

" Faster open file in new tab
nnoremap <leader>e :tabe 

" Quicker jump to last buffer
nnoremap <silent> <leader>j :w<bar>b#<CR>

" Quicker switch to relative numbering
nnoremap <silent> <leader>R :set relativenumber!<CR>

" Quicker save the current file
nnoremap <silent> <leader>w :w<CR>

" Insert a blank line below the current line
nnoremap <silent> <leader>o o<Esc>

" Quicker check which files ar open
nnoremap <silent> <leader>L :ls<CR>

" Quicker check which marks are set
nnoremap <silent> <leader>M :marks<CR>

" Quicker make
nnoremap <silent> <leader>m :!clear;make<CR>

" Open the current buffer in a new tab
nnoremap <silent> <leader>t :tabe %<cr>

" Quicker visual block mode
nnoremap <silent> <leader>v <C-S-v>

" Easier generic command
nnoremap <leader>; :
vnoremap <leader>; :

" Quick substitute
vnoremap <leader>s :s/
nnoremap <leader>s V:s/

" Quick reload file
nnoremap <leader>l :e % <cr>

" Quicker repeat last colon command
nnoremap <leader>. q:k<cr>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Run the current file based on filetype
function! Compile(compile_command)
  if filereadable("./Makefile") || filereadable("./makefile")
    make
  else
    execute "!" . a:compile_command . " " . bufname("%")
  endif
endfunction

autocmd FileType python        nmap <leader>r :!python %<cr>
autocmd FileType scheme        nmap <leader>r :!racket %<cr>
autocmd FileType sh            nmap <leader>r :!bash %<cr>
autocmd FileType perl          nmap <leader>r :!perl %<cr>
autocmd FileType haskell       nmap <leader>r :!runhaskell %<cr>
autocmd FileType java          nmap <leader>r :silent call Compile("javac")<cr> <bar>:!java %:r<cr>
autocmd FileType c             nmap <leader>r :silent call Compile("gcc")  <cr> <bar>:!./a.out <cr>
autocmd BufNew,BufEnter *.bdot nmap <leader>r :!bdgraph %<cr> <bar>:e %<cr>
autocmd VimEnter        *      :so ~/.vimrc

" Search across all open buffers
function! BuffersList()
  let all = range(0, bufnr('$'))
  let res = []
  for b in all
    if buflisted(b)
      call add(res, bufname(b))
    endif
  endfor
  return res
endfunction

function! GrepBuffers(expression)
  exec 'vimgrep/'.a:expression.'/ '.join(BuffersList())
endfunction

command! -nargs=+ GrepBufs call GrepBuffers(<q-args>)
nnoremap <leader>/ :GrepBufs 
nnoremap <leader>* :call GrepBuffers("<C-R><C-W>")<CR> <bar> :copen 7<cr>

" List macros
nnoremap <leader>? :echo "
      \  : Clear highlighting \n
      \1 : jump to tab number (1-9, 0)\n
      \b : toggle mouse\n
      \c : ! command \n
      \d : open in new window \n
      \e : open in new buffer \n
      \H : horizontal split \n
      \j : jump to last buffer \n
      \L : ls \n
      \l : reload file \n
      \M : show marks \n
      \m : make \n
      \o : insert blank line \n
      \P : toggle paste mode \n
      \p : rewrap paragraph \n
      \q : close window \n
      \R : relative numbering \n
      \r : run current file \n
      \S : switch windows \n
      \s : substitute \n
      \t : tab current buffer\n
      \V : vertical split \n
      \v : visual block \n
      \w : save \n
      \x : close file \n
      \Z : toggle spell check \n
      \z : za\n
      \"<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When jumping to tags, recenter
nnoremap <silent> <C-]> <C-]>zz

" Recenter on find next
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

" Move through columns correctly
nnoremap <silent> j gj
nnoremap <silent> k gk

" Switch buffers with parens
noremap <silent> ( :bp<cr>zz
noremap <silent> ) :bn<cr>zz

" Switch tabs with braces
nnoremap <silent> { :tabp<cr>
nnoremap <silent> } :tabn<cr>

" Faster scrolling Down
nnoremap J 5<C-e>5gj
vnoremap J 5<C-e>5gj

nnoremap <M-j> 4gj
vnoremap <M-j> 4gj

nnoremap <silent> <Down> L5<C-e>5gj

" Map old J to ctrl-j
nnoremap <C-j> J
vnoremap <C-j> J

" Faster scrolling Up
nnoremap K 5<C-y>5gk
vnoremap K 5<C-y>5gk

nnoremap <M-k> 4gk
vnoremap <M-k> 4gk

nnoremap <silent> <Up> H5<C-y>5gk

" Faster repeat last command
nnoremap <silent> <C-@> @@

" Better jump to previous location
nnoremap <silent> <C-o> <C-o>zz

" Faster cycle through quickfix
nnoremap <C-{> :cp<cr>
nnoremap <C-}> :cn<cr>

" Faster move to end and start of lines
nnoremap B ^
nnoremap E $
vnoremap B ^
vnoremap E $

" Faster escape?
inoremap jk <Esc>:w<cr>

" Smarter [Y]anking ? 
map Y y$

" Completion in insert mode with ctrl-Space
" Default pulls from open files, adding the dictionary pulls from there too
set dictionary=/usr/share/dict/words
map <leader>+ :set complete+=k<CR>
map <leader>- :set complete-=k<CR>

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

inoremap <silent> <Tab> <C-R>=Tab_Or_Complete()<CR>

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
set shiftwidth=4                 " Set 4 spaces for indenting
set tabstop=4                    " Set 4 TAB stops
set softtabstop=4
set expandtab                    " Spaces instead of tabs
set smarttab
set autoindent                   " Set auto indenting on
set smartindent
set nocindent                    " Do not use C language indent style
set showmatch                    " Show matched brackets
