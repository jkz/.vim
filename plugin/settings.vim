" Settings for vim
"
" Maintainer Jesse the Game
" Last change 14/01/2013

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc
au BufWritePost vimrc so ~/.vimrc

" Pathogen allows plugins to be installed as bundles, like repositories,
" in 'bundle/'.
call pathogen#infect()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file
  set backupdir=~/.vim/backup
  set directory=~/.vim/tmp
endif
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching

" Persistent undo history
set undofile                " Save undo's after file closes
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch background=dark
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

set hidden

set nonumber
set mouse=i
set tabstop=8
set expandtab
set textwidth=79
set shiftwidth=4
set softtabstop=4

" bash like auto-completion
set wildmenu
set wildmode=list:longest

" Highlight Current Line
" set cul                                           " highlight current line
" hi CursorLine term=none cterm=none ctermbg=3      " adjust color

" hi CursorLine   cterm=NONE ctermbg=8 ctermfg=black guibg=#222222 guifg=black
" hi CursorColumn cterm=NONE ctermbg=8 ctermfg=black guibg=#222222 guifg=black

" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline

set cursorline

" Set active window size
    augroup WinSize
        autocmd!
        autocmd BufWinEnter * set winwidth=80
        autocmd BufWinLeave * set winwidth=79
    augroup END

" Set 80-char coloring only on active window
if exists('+colorcolumn')
    augroup BgHighlight
        autocmd!
        autocmd BufWinEnter * set colorcolumn=80
        autocmd BufWinLeave * set colorcolumn=0
    augroup END
"else
"    augroup BgHighlight
"        autocmd!
"        autocmd WinEnter * set colorcolumn=80
"        autocmd WinLeave * set colorcolumn=0
"    augroup END
    "au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


" When I close a tab, remove the buffer
set nohidden

" Open new splits on the right
set splitright

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Automatically cd into the directory that the file is in
" autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
set autochdir
set smartcase
set incsearch
set scrolloff=5         "Keep at least 5 lines above/below

" Remove all trailing whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" but only show tabs and trailing whitespace
set listchars=tab:>·,trail:·

