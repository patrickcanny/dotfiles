" START VUNDLE
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" BEGIN PLUGINS
Plugin 'VundleVim/Vundle.vim' 
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sleuth'
Plugin 'preservim/nerdtree'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'shinchu/lightline-gruvbox.vim'
Plugin 'vim-scripts/mru.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'doums/coBra'
Plugin 'ternjs/tern_for_vim'
Plugin 'neoclide/vim-jsx-improve'
Plugin 'fatih/vim-go'
Plugin 'sbdchd/neoformat'
Plugin 'ctrlpvim/ctrlp.vim'
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

inoremap {<CR> {<CR>}<C-o>0
inoremap [<CR> [<CR>]<C-o>0

" fast fugitive
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gd :Git diff<CR>

" tab switch
nnoremap <leader>n gt
nnoremap <leader>N gT
nnoremap <leader>t :tabclose<CR>

" quick switch to react
nnoremap <leader>re :set filetype=javascriptreact<CR>

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
let NERDTreeShowHidden=1

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
nnoremap <leader>f :MRU<CR>

" fzf
set rtp+=/usr/local/opt/fzf

" Prettier
autocmd BufWritePre *.js Neoformat

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" braces?
let s:pairs={
            \'<': '>',
            \'{': '}',
            \'[': ']',
            \'(': ')',
            \'«': '»',
            \'„': '“',
            \'“': '”',
            \'‘': '’',
        \}
call map(copy(s:pairs), 'extend(s:pairs, {v:val : v:key}, "keep")')
function! InsertPair(left, ...)
    let rlist=reverse(map(split(a:left, '\zs'), 'get(s:pairs, v:val, v:val)'))
    let opts=get(a:000, 0, {})
    let start   = get(opts, 'start',   '')
    let lmiddle = get(opts, 'lmiddle', '')
    let rmiddle = get(opts, 'rmiddle', '')
    let end     = get(opts, 'end',     '')
    let prefix  = get(opts, 'prefix',  '')
    let start.=prefix
    let rmiddle.=prefix
    let left=start.a:left.lmiddle
    let right=rmiddle.join(rlist, '').end
    let moves=repeat("\<Left>", len(split(right, '\zs')))
    return left.right.moves
endfunction
 noremap! <expr> ,f   InsertPair('{')
 noremap! <expr> ,h   InsertPair('[')
 noremap! <expr> ,s   InsertPair('(')
 noremap! <expr> ,u   InsertPair('<')
