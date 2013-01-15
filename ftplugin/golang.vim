set rtp+=$GOROOT/misc/vim
autocmd BufWritePre *.go :silent Fmt
autocmd FileType go setlocal sts=4 ts=4 sw=4 noet

" This is a hackish construct to make some go stuff work.
filetype off
filetype plugin indent on
syntax on

