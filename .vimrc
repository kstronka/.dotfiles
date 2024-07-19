syntax on
filetype on
colorscheme habamax

set swapfile
set dir=~/tmp

set nocompatible

set path+=**
set wildmenu
set wildmode=longest:full,full

set rnu
set cursorline
set expandtab shiftwidth=4 tabstop=4

nnoremap <leader>v :Ex<cr>
let g:netrw_banner=0
let g:netrw_liststyle=1

" turn off expandtab for makefiles
autocmd FileType make setlocal noet ci pi sts=0 sw=4 ts=4

inoremap jj <ESC>
inoremap kk <ESC>
nnoremap <space> :
nnoremap <space><space> :Ex<CR>


nnoremap = :set wrap!<CR>
nnoremap - :set rnu!<CR>

" Window management
nnoremap <C-w><C-n> :sp<CR>
nnoremap <C-w><C-p> :vsp<CR>
nnoremap <C-w><C-k> :q<CR>
nnoremap <C-w><C-[> <C-w>h
nnoremap <C-w><C-]> <C-w>l

" Tab navigation
nnoremap <C-t><C-t> :tabnew<CR>
nnoremap <C-t><C-e> :tabe<space>
nnoremap <C-t><C-k> :tabc<CR>
nnoremap <C-t><C-[> :tabp<CR>
nnoremap <C-t><C-]> :tabn<CR>

" Buffer navigation
nnoremap <C-b><C-b> :ls<CR>
nnoremap <C-b><C-j> :ls<CR>:b<space>
nnoremap <C-b><C-[> :bp<CR>
nnoremap <C-b><C-]> :bn<CR>

" Quicklist Navigation
nnoremap <M-F7> yiw:grep<space>-R<space><C-r>"<space>
nnoremap <C-l><C-l> :copen<CR>
nnoremap <C-l><C-k> :cclose<CR>
nnoremap <C-l><C-[> :cp<CR>
nnoremap <C-l><C-]> :cn<CR>

" TODO: implement jumping between occurrences of a given string within a buffer
" TODO: implement grepping buffers for items

" Autocompletion
set completeopt=noselect,menu

let g:compl_trigger_active=1
function! TriggerCompletion()

    if &omnifunc != '' && pumvisible() == 0 && g:compl_trigger_active == 1
        let g:compl_trigger_active=0
	    call feedkeys("\<C-n>", 'n')
        if pumvisible() 
            let g:compl_trigger_active=1
        endif
    end

endfunction

let g:spacebar_press_handling=1
function! ActivateCompletion()
    if g:spacebar_press_handling == 1
        let g:spacebar_press_handling=0

        let g:compl_trigger_active=1
        call feedkeys(" ", 'n')

        let g:spacebar_press_handling=1
    endif
endfunction

inoremap <silent> <Space> <Esc>:call ActivateCompletion()<CR>a
autocmd TextChangedI * call TriggerCompletion()
