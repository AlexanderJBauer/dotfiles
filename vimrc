syntax on
" No error noises when hittng EOL
set noerrorbells
set noeb vb t_vb=
set belloff=all
" Tab sizing
set tabstop=2
set softtabstop=2
" How far to shift lines when shifting
set shiftwidth=2
" Whether or not to use spaces for tabs
set expandtab
" Auto-indenting
set smartindent
set smarttab
" Set line numbers
set nu
" Always show status line
set laststatus=2
"set nowrap
set wrap
set breakindent
set breakindentopt=sbr
set showbreak=↪>
set smartcase
set noswapfile
set updatetime=350
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch
set backspace=indent,eol,start
" Timeout on custom mappings
if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif
" Set min distance between cursor and top and side
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=0
endif
set sidescroll=1
" Show as many characters as possible
set display+=lastline
" Show following hidden characters as
set listchars=tab:>-,trail:~,extends:>,precedes:<,nbsp:+
set list
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif
" Always show sign column, even when no signs
set signcolumn=yes
set colorcolumn=80,120
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Make mouse behave `normally`
set mouse=a

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" themes
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'rakr/vim-one'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" functionality
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wesQ3/vim-windowswap'
Plug 'terryma/vim-multiple-cursors'
Plug 'yuttie/comfortable-motion.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/goyo.vim'
Plug 'ervandew/supertab'

call plug#end()

colorscheme monokai
"colorscheme gruvbox
"colorscheme one
"colorscheme onehalfdark
"colorscheme codedark

set background=dark

let g:airline#extensions#tabline#formatter = 'unique_tall'

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_altv = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

let g:gitgutter_max_signs = -1

" Goyo
let g:goyo_width = 120

" Coc auto-install
let g:coc_global_extensions = [
\   'coc-json',
\   'coc-tsserver',
\   'coc-explorer',
\   'coc-eslint',
\   'coc-prettier'
\ ]

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Steroid search
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --hidden -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" shortcuts
nnoremap <SPACE> <Nop>
nnoremap t <Nop>
let mapleader = " "
nnoremap H :wincmd h<CR>
nnoremap J :wincmd j<CR>
nnoremap K :wincmd k<CR>
nnoremap L :wincmd l<CR>
nnoremap <Tab> gT<CR>
nnoremap T gT<CR>
nnoremap t gt<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>t :tabe<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>b :CocCommand explorer<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <leader>f :Rg<SPACE>
nnoremap <leader>F :RG<CR>
nnoremap <leader>p :Files<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>cc :vsplit ~/.vimrc<CR>
nnoremap <leader>cs :source ~/.vimrc<CR>
nnoremap <leader><Left> :vnew<CR>
nnoremap <leader><up> :new<CR>
nnoremap <leader><down> :below new<CR>
nnoremap <leader>cfp :let @* = expand("%:p")<CR>

nnoremap <silent> <leader>h :call CocActionAsync('doHover')<CR>

nnoremap <leader>J :e <C-R>=expand("%:p:r")<CR>.
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

nnoremap <leader>+ :resize +5<CR>
nnoremap <leader>- :resize -5<CR>
nnoremap > :vertical resize +5<CR>
nnoremap < :vertical resize -5<CR>
nnoremap <leader>r :vertical resize 128<CR>
nnoremap <leader>rs :vertical resize 38<CR>
nnoremap <leader>rm :vertical resize 88<CR>
nnoremap <leader>rl :vertical resize 158<CR>

nnoremap <leader>mm :MinimapToggle<CR>

nnoremap ` :Marks<CR>
nnoremap dm :execute 'delmarks '.nr2char(getchar())<cr>

" Easy window jumping with 1-9
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

tnoremap <esc><esc> <c-\><c-n>
