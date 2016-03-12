set nocompatible

source ~/.vim/myvimrc-common.vim


map <C-h> :A<CR>
nmap <C-g> "fyiw:A<CR>/<C-r>f<CR>

" search path for source/header switching
let g:alternateSearchPath = 'sfr:./private,sfr:..,../src,sfr:../include,sfr:../inc'

" map <F5> :!run.cmd<CR>
" For polaris build project
map <F5> :!./build.sh HOST<CR>
map <F6> :!./build.sh HOST TEST<CR>
map <F7> :!./build.sh HOST CLEAN<CR>

nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>k :YcmCompleter GetDoc<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>i :YcmCompleter GoToInclude<CR>
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

" Disable tab as completion key
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

set makeprg=~/make_master.sh
