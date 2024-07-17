syntax on
filetype on
colorscheme desert

set nocompatible

set path+=**
set wildmenu
set wildmode=longest:full,full

set rnu
set cursorline
set expandtab shiftwidth=4 tabstop=4
set omnifunc=syntaxcomplete#Complete

nnoremap <leader>v :Ex<cr>
let g:netrw_banner=0
let g:netrw_liststyle=1

" turn off expandtab for makefiles
autocmd FileType make setlocal noet ci pi sts=0 sw=4 ts=4

inoremap jj <ESC>
inoremap kk <ESC>

nnoremap = :set wrap!<CR>
nnoremap - :set rnu!<CR>

nnoremap <leader>b :ls<cr>:b<space>
nnoremap SS :w<cr>

nnoremap <space> :

" Tab navigation
nnoremap <C-t><C-t> :tabnew<CR>
nnoremap <C-t><C-e> :tabe<space>
nnoremap <C-t><C-k> :tabc<CR>
nnoremap <C-t><C-[> :tabp<CR>
nnoremap <C-t><C-]> :tabn<CR>

" Buffer navigation
nnoremap <C-b><C-b> :ls<CR>
nnoremap <C-b><C-[> :bp<CR>
nnoremap <C-b><C-]> :bn<CR>

" Autocompletion
set completeopt=noselect,menu

let g:omnicompl_trigger_active=1
function! TriggerOmniCompletion()

    if &omnifunc != '' && pumvisible() == 0 && g:omnicompl_trigger_active == 1
        let g:omnicompl_trigger_active=0
	    call feedkeys("\<C-x>\<C-o>", 'n')
        if pumvisible() 
            let g:omnicompl_trigger_active=1
        endif
    end

endfunction

let g:spacebar_press_handling=1
function! ActivateOmniCompletion()
    if g:spacebar_press_handling == 1
        let g:spacebar_press_handling=0

        let g:omnicompl_trigger_active=1
        call feedkeys(" ", 'n')

        let g:spacebar_press_handling=1
    endif
endfunction

inoremap <silent> <Space> <Esc>:call ActivateOmniCompletion()<CR>a
autocmd TextChangedI * call TriggerOmniCompletion()
