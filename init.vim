" Annoying characters that are normally invisible
set listchars=tab:>-,trail:~,extends:>,precedes:<,nbsp:+
set list

" Set rulers at given column values
set colorcolumn=81,121

" Show line numbers
set nu

" Show sign column, even when there are no signes
" set signcolumn=yes

" if set, only insert spaces; otherwise insert \t and complete with spaces:
" shouldbe handled by tree sitter
" set expandtab

" length of an actual \t character:
set tabstop=2
" length to use when editing text (eg. TAB and BS keys)
" (0 for ‘tabstop’, -1 for ‘shiftwidth’):
set softtabstop=-1
" length to use when shifting text (eg. <<, >> and == commands)
" (0 for ‘tabstop’):
set shiftwidth=0

" Make mouse behave `normally`
set mouse=a

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'ryanoasis/vim-devicons'
Plug 'tanvirtin/monokai.nvim'

call plug#end()

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "html",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "latex",
    "lua",
    "python",
    "regex",
    "rust",
    "scss",
    "typescript",
    "yaml",
  },
}
EOF

" theming
colorscheme monokai

" coq settings
let g:coq_settings = { 'auto_start': 'shut-up' }
let g:coq_settings = { 'display.pum.fast_close': v:false }

" key bindings
nnoremap <SPACE> <Nop>
let mapleader = " "

" file explorer
nnoremap <leader>b <cmd>CHADopen<cr>

" window movement
nnoremap H :wincmd h<CR>
nnoremap J :wincmd j<CR>
nnoremap K :wincmd k<CR>
nnoremap L :wincmd l<CR>

" window creation
nnoremap <leader><Left> :vnew<CR>
nnoremap <leader><up> :new<CR>
nnoremap <leader><down> :below new<CR>

" tab movement
nnoremap <leader>t :tabe<CR>
nnoremap <Tab> gT<CR>
nnoremap T gT<CR>
nnoremap t gt<CR>

" search
nnoremap <leader>/ :BLines<CR>
nnoremap <leader>f :Rg<SPACE>
nnoremap <leader>F :RG<CR>
nnoremap <leader>p :Files<CR>

" config
nnoremap <leader>cc :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <leader>sc :source ~/.config/nvim/init.vim<CR>

" ability to exit terminal insert mode using escape
tnoremap <esc><esc> <c-\><c-n>

" copy path of current file
nnoremap <leader>cfp :let @* = expand("%:p")<CR>

