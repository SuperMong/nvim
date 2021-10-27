"
" Zhang Jiaxiang's vimrc
"

""" Basic map
map ; :

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

""" Vim-Plug
call plug#begin('~/.config/nvim/plugged')

" Snippets
Plug 'SirVer/ultisnips'
call plug#end()

