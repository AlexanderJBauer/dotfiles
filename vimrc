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

" Set editor columns at common styling max line
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

call plug#end()

"colorscheme gruvbox
colorscheme onehalfdark
set background=dark

if (executable('rg'))
  let g:rg_derive_root='true'
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

let g:airline#extensions#tabline#formatter = 'unique_tall'

let g:netrw_browse_split = 2
let g:netrw_winsize = 80
let g:netrw_liststyle = 3

let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-v>', '<2-LeftMouse>'],
    \ 'AcceptSelection("v")': ['<cr>', '<RightMouse>'],
    \ }

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

nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>r :vertical resize 120<CR>
nnoremap <silent> <leader>rs :vertical resize 30<CR>
nnoremap <silent> <leader>rm :vertical resize 80<CR>
nnoremap <silent> <leader>rl :vertical resize 150<CR>
