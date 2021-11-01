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
map <C-s> :w<CR>
map <C-q> :q<CR>

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
set autowrite
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

" Wildfire
Plug 'gcmt/wildfire.vim'

" Vim-Surround
Plug 'tpope/vim-surround'

" Vim-Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Split Join
Plug 'AndrewRadev/splitjoin.vim'

" Undo Tree
Plug 'mbbill/undotree'

" Nerd Tree
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}

" Status line
Plug 'vim-airline/vim-airline'

" Color
Plug 'fatih/molokai'
call plug#end()

" ===
" === Plug Settings
" ===

" === ultisnips
" Trigger configuration
" leg g:UltiSnipsJumpForwardTrigger = "
" leg g:UltiSnipsJumpBackwardTrigger = "

" === Table Mode
" Open table mode with <LEADER>tm
noremap <LEADER>tm :TableModeToggle<CR>

" === Vim-Go
" Run 'go run' with <LEADER>r
autocmd FileType go nmap <LEADER>r <Plug>(go-run)

" Run 'go build' or 'go test compile' with <LEADER>b, which based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" Use goimports, not fmt
let g:go_fmt_command = "goimports"

" Run gometalinter (call 'vet' 'lint' and 'errcheck') automatically when saving the file
let g:go_metalinter_autosave = 1

" Show single tab as 4 spaces
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" Hightlight settings
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

" === UndoTree
" Open UndoTree with <LEADER>ut
noremap <LEADER>ut :UndotreeToggle<CR>

" === NerdTree
" Open NerdTree with <LEADER>nt
noremap <LEADER>nt :NERDTreeToggle<CR>

" Change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" === Molokai
" Enable molokai with original color scheme and 256 color version
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
