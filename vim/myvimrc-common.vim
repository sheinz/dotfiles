
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
"Plugin 'exclipy/clang_complete'
"Bundle 'davidhalter/jedi-vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'
Plugin 'majutsushi/tagbar'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'solarnz/thrift.vim'
Plugin 'dkprice/vim-easygrep'
" Markdown plugin for README.md files
" Plugin 'suan/vim-instant-markdown'
" Comment plugin
Plugin 'tomtom/tcomment_vim'
" Surrounding plugin
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
" Automatic closing bracket
Plugin 'jiangmiao/auto-pairs'
" Perforce integration
Plugin 'nfvs/vim-perforce'
call vundle#end()

set nocompatible
filetype plugin indent on

map <F2> :NERDTreeToggle<CR>
map <F3> :TagbarToggle<CR>

" Display buffers and select 
nmap <C-b> :buffers<CR>:buffer<Space>
" Delete current buffer and go to the next one
nmap ]d :bnext<CR>:bdelete #<CR>

" General indentation settings
set tabstop=4
set shiftwidth=4
set expandtab

" Make backspace act normaly
set backspace=indent,eol,start

" Show statusline even if only one window is open
set laststatus=2

" Show trailing whitepace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
command CheckSpaces match ExtraWhitespace /\s\+$/

" Check spelling for English
command CheckSpell setlocal spell spelllang=en_us

" Look for tag def in a "tags" file in the dir of the current file, then for
" that same file in every folder above the folder of the current file, until the
" root.
set tags=./tags;/

" Generate tags for the current project
command GenCtags !ctags -R --exclude=".git"

" Switch modified buffers
set hidden

" Shorter window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" case insensitive searching
set ignorecase          
" but become case sensitive if you type uppercase characters
set smartcase      

" Enhanced tab complition of command line arguments
set wildmenu

set nohlsearch " do not highlight searched-for phrases
set incsearch " ...but do highlight-as-I-type the search string

" Make mouse work in tmux
set mouse=a

if has('unnamedplus')
  " By default, Vim will not use the system clipboard when yanking/pasting to
  " the default register. This option makes Vim use the system default
  " clipboard.
  " Note that on X11, there are _two_ system clipboards: the "standard" one, and
  " the selection/mouse-middle-click one. Vim sees the standard one as register
  " '+' (and this option makes Vim use it by default) and the selection one as
  " '*'.
  " See :h 'clipboard' for details.
  set clipboard=unnamedplus,unnamed
else
  " Vim now also uses the selection system clipboard for default yank/paste.
  set clipboard+=unnamed
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Clipboard                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 ctrlp                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<leader>t'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 UltiSnips                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets = "<leader>s"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                yankring                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:yankring_history_dir = '$HOME/tmp/vim'
" this is so that single char deletes don't end up in the yankring
let g:yankring_min_element_length = 2
let g:yankring_window_height = 14
nnoremap <leader>r :YRShow<CR>

" this makes Y yank from the cursor to the end of the line, which makes more
" sense than the default of yanking the whole current line (we can use yy for
" that)
function! YRRunAfterMaps()
    nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Color Scheme                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme desert
if has('gui_running')
    if has("gui_gtk2")
        set guifont=Ubuntu\ Mono\ 11
        set guioptions-=m  " Remove menu bar
        set guioptions-=T  " Remove toolbar
    else
        set guifont=Consolas:h11
    endif
    " Start maximized
    set columns=999 lines=999
endif
