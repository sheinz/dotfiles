set nocompatible

source ~/.vim/myvimrc-common.vim


map <C-h> :A<CR>
nmap <C-g> "fyiw:A<CR>/<C-r>f<CR>


" map <F5> :!run.cmd<CR>
" For polaris build project
map <F5> :!./build.sh HOST<CR>
map <F6> :!./build.sh HOST TEST<CR>
map <F7> :!./build.sh HOST CLEAN<CR>

nnoremap <Leader>d :YcmCompleter GoToDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion = 1

" Disable tab as completion key
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]


source ~/.vim/youcompleteme.vim
