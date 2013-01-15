" Aliases for vim
"
" Maintainer Jesse the Game
" Last change 15/12/2012
"
" To use it, source it from ~/.vimrc

nnoremap j h
nnoremap k gj
nnoremap l gk
nnoremap ; l

nnoremap <tab> >>
nnoremap <S-tab> <<

vnoremap j h
vnoremap k gj
vnoremap l gk
vnoremap ; l

vnoremap <tab> >gv
vnoremap <S-tab> <gv

nnoremap <Space> :

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Concatenate lines
nnoremap H J
" TODO write something fancy that reverses J
" nnoremap h lbi<CR><Esc>  <-- this is not it

" Home and end by Shift + Up/Down
nmap J ^
nmap : $

" Page up and down on Shift + Up/Down
nnoremap L 7k
nnoremap K 7j

" Make Y behave like D and C
nnoremap Y v$hy


" Browse splits
" nnoremap <c-j> <c-w>h<c-w>_
"nnoremap <c-k> <c-w>j<c-w>_
"nnoremap <c-l> <c-w>k<c-w>_
"nnoremap <c-;> <c-w>l<c-w>_

nnoremap <Up> <c-w>k<c-w>_
nnoremap <Down> <c-w>j<c-w>_
nnoremap <Left> <c-w>h<c-w>_
nnoremap <Right> <c-w>l<c-w>_

"nnoremap <c-k> <c-w>j<c-w>_
"nnoremap <c-l> <c-w>k<c-w>_
"nnoremap lkj <c-w>h<c-w>_
"nnoremap jkl <c-w>l<c-w>_

set winminheight=0
"set winheight=999
"set winwidth=80

" Resize splits
nnoremap oui <C-w><
nnoremap 8ki <C-w>-
nnoremap ik8 <C-w>+
nnoremap iuo <C-w>>

" Allow moving around with hjkl
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>
"inoremap <C-k> <Up>
"inoremap <C-j> <Down>

" Homerow hands for escape
inoremap jf <Esc>
inoremap fj <Esc>:w<CR>

" undo/redo while typing
inoremap <C-r> <Esc><C-r>i
inoremap <C-u> <Esc>ui

" home/end
"inoremap lkj <Esc>I
"inoremap jkl <Esc>A

" quotes around
" inoremap '' ''<Esc>i
" inoremap "" ""<Esc>i

nnoremap <A-i> :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap <A-a> :exec "normal a".nr2char(getchar())."\e"<CR>
nnoremap <A-c> ciw

" Insert empty line.
"nmap <A-o> o<ESC>k
"nmap <A-O> O<ESC>j
nmap <C-o> o<ESC>k
nmap <C-S-o> O<ESC>j

" Map paste toggle to F2 and show mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Toggle line numbers
set nonumber
nmap <silent> <C-N> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" Open brackets/colons with close
inoremap {{} {<CR>}<ESC>O
inoremap (() (<CR>)<ESC>O

" Quickly set comma or semicolon at the end of the string
inoremap ,, <End>,
inoremap ;; <End>;
au FileType python inoremap :: <End>:

" Moving in buffers.
"nnoremap <C-S-tab> :bprev<CR>
"nnoremap <C-tab> :bnext<CR>


" (?P<|>[^/]+)
inoremap (?PP (?P<>[^/]+)/<ESC><S-F>>i

" Use ; for : in normal mode (easier for commands)
" nnoremap ; :

" Swapping windows
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

