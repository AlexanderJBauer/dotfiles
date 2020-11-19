syntax on

" No error noises when hittng EOL
set noerrorbells

" Tab sizing
set tabstop=2 softtabstop=2

" How far to shift lines when shifting
set shiftwidth=2

" Whether or not to use spaces for tabs
set expandtab

" Auto-indenting
set smartindent

" Set line numbers
set nu
" Always show status line
set laststatus=2
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80,120
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
"Plug 'vim-utils/vim-man'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wesQ3/vim-windowswap'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'tomasiser/vim-code-dark'
Plug 'rakr/vim-one'

call plug#end()

"colorscheme gruvbox
"colorscheme onehalfdark
colorscheme codedark
"colorscheme one
set background=dark

if (executable('rg'))
  let g:rg_derive_root='true'
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

let g:airline#extensions#tabline#formatter = 'unique_tall'

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1

let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-v>', '<2-LeftMouse>'],
    \ 'AcceptSelection("v")': ['<cr>', '<RightMouse>'],
    \ }

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

nnoremap <SPACE> <Nop>
let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>b :wincmd v<bar> :Ex <bar> :vertical resize 80<CR>
nnoremap <leader>f :Rg<SPACE>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>cf :vsplit ~/.vimrc<CR>
nnoremap <leader>cr :source ~/.vimrc<CR>
nnoremap <leader><Left> :vnew<CR>
nnoremap <leader><up> :new<CR>
nnoremap <leader><down> :below new<CR>

nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>r :vertical resize 120<CR>
nnoremap <silent> <leader>rs :vertical resize 30<CR>
nnoremap <silent> <leader>rm :vertical resize 80<CR>
nnoremap <silent> <leader>rl :vertical resize 150<CR>

" Easy window jumping with 1-9
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

