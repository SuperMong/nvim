"	 _____ _       __     ___                    
"	|__  /(_)_  __ \ \   / (_)_ __ ___  _ __ ___ 
"	  / / | \ \/ /  \ \ / /| | '_ ` _ \| '__/ __|
"	 / /_ | |>  <    \ V / | | | | | | | | | (__ 
"	/____|/ /_/\_\    \_/  |_|_| |_| |_|_|  \___|
"	    |__/                                     

" ===
" === Basic mappings
" ===
map ; :
noremap s <nop>

" Build <LEADER> as <SPACE>
let mapleader=" "

" Save & Quit
map S :w<CR>
map Q :q<CR>

" Edit vimrc anytime
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Move the corsur
map J 5j
map K 5k
map H 5h
map L 5l

" Copy to system clipboard
vnoremap Y "+y

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Split window
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Move cursor around windows
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

" Resize window
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize -5<CR>
noremap <right> :vertical resize +5<CR>

" Place window
noremap sh <C-w>t<C-w>K
noremap sv <C-w>t<C-w>H

" Press space twice to jump to the next '(--)' and edit it
noremap <LEADER><LEADER> <Esc>/(--)<CR>:nohlsearch<CR>c4l

" Spell check
noremap <LEADER>sc :set spell<CR>

" ===
" === Editor behavior
" ===
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set scrolloff=5
set splitright
set splitbelow
set showcmd
set wildmenu
set ignorecase
set smartcase
set wrap
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Vim-Plug
" ===
call plug#begin('~/.config/nvim/plugged')

" Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Table Mode
Plug 'dhruvasagar/vim-table-mode'

" Undo Tree
Plug 'mbbill/undotree'

" Nerd Tree
Plug 'preservim/nerdtree'

" Status line
Plug 'vim-airline/vim-airline'

" Color
Plug 'theniceboy/nvim-deus'
call plug#end()

" ===
" === Plug Settings
" ===

" === ultisnips
" Trigger configuration
" leg g:UltiSnipsJumpForwardTrigger="
" leg g:UltiSnipsJumpBackwardTrigger="

" === Table Mode
" Open table mode with <LEADER>tm
noremap <LEADER>tm :TableModeToggle<CR>

" === UndoTree
" Open UndoTree with <LEADER>ut
noremap <LEADER>ut :UndotreeToggle<CR>

" === NerdTree
" Open NerdTree with <LEADER>nt
noremap <LEADER>nt :NERDTreeFocus<CR>

" Change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
