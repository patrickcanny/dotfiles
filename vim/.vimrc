" START VUNDLE
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" BEGIN PLUGINS
Plugin 'VundleVim/Vundle.vim' 
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
Plugin 'junegunn/goyo.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'shinchu/lightline-gruvbox.vim'
Plugin 'vim-scripts/mru.vim'
Plugin 'ycm-core/YouCompleteMe'
" END PLUGINS
call vundle#end()
" END VUNDLE
set history=500
filetype plugin on
filetype indent on
set autoread
let mapleader = ","
set nu
set background=dark
set laststatus=2
set noshowmode
nnoremap <leader>pp :PluginInstall<CR>
nmap <leader>w :w!<cr>
set so=7
let $LANG='en'
set langmenu=en
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.DS_Store
set ruler
set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set foldcolumn=1

let g:gruvbox_italic=1
syntax on
set t_Co=256
try
    colorscheme gruvbox
catch
    colorscheme desert
endtry
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" use spaces
set expandtab
set smarttab

" tabs
set tabstop=4
set shiftwidth=4

" 500 character lines
set lbr
set tw=500

" auto indent, smart indent, wrap
set ai
set si
set wrap

" no scrolling
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" fast file open
nnoremap <leader>s :e **/

" fast fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gd :Gdiff<CR>

" tab switch
nnoremap <leader>n gt
nnoremap <leader>N gT
nnoremap <leader>t :tabclose<CR>

" visual stuff
" star search 
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" move
map <space> /
map <c-space> ?

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" splits
map <leader>ss :split<CR>
map <leader>vv :vsplit<CR>

" PLUGIN STUFF
" NerdTree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Lightline
let g:lightline = {
    \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
\}
let g:lightline.colorscheme = 'gruvbox'

" MRU
nnoremap <leader>g :MRU<CR>
