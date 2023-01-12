syntax on
colorscheme elflord

filetype on

set number
set expandtab
set tabstop=4

" turn off expandtab for makefiles
autocmd FileType make setlocal noet ci pi sts=0 sw=4 ts=4


inoremap jj <ESC>
inoremap kk <ESC>

nnoremap <C-j> 10j
nnoremap <C-k> 10k
xnoremap <C-j> 10j
xnoremap <C-k> 10k

nnoremap <C-h> 5h
nnoremap <C-l> 5l
xnoremap <C-h> 5h
xnoremap <C-l> 5l

nnoremap <C-,> :set wrap!<CR>
nnoremap <C-.> :set rnu!<CR>
