syntax on
filetype on
colorscheme desert

set nocompatible

set path+=**
set wildmenu

set rnu
set cursorline
set expandtab shiftwidth=4 tabstop=4

nnoremap <leader>v :Ex<cr>
let g:netrw_banner=0
let g:netrw_liststyle=3

" turn off expandtab for makefiles
autocmd FileType make setlocal noet ci pi sts=0 sw=4 ts=4

inoremap jj <ESC>
inoremap kk <ESC>

nnoremap = :set wrap!<CR>
nnoremap - :set rnu!<CR>

