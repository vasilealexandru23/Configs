"General editor settings
set tabstop=4     
set nocompatible
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set ruler
set showcmd
set number
set relativenumber
set mouse=a
set hlsearch
set noswapfile
set updatetime=200
set encoding=utf-8
set wildmenu
set title
syntax on
filetype indent on

"Append template to new C++ files
autocmd BufNewFile *.cpp 0r ~/vimcp/Library/Template.cpp
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $
autocmd filetype c nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

set makeprg=~/vimcp/Problems/C++/build.sh\ %:r
autocmd filetype cpp nnoremap <F9> :w <bar> Make <CR>
autocmd filetype cpp nnoremap <F10> :vertical terminal ++shell ++cols=40 ./%:r<CR>
autocmd filetype cpp nnoremap <F11> :!./%:r<CR>

set colorcolumn=80

"keybindings for { completion, "jk" for escape, ctrl-a to select all
imap jk <Esc>
map <C-a> <esc>ggVG<CR>
set belloff=all
let &t_SI = "\<Esc>]12;green\x7"
let &t_EI = "\<Esc>]12;white\x7"


"Plugin setup
call plug#begin()

Plug 'flazz/vim-colorschemes'
Plug 'Valloric/YouCompleteMe', { 'do' : './install.py --clang-completer --system-libclang' }
call plug#end()

let g:ycm_enable_diagnostic_signs = 0
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
colorscheme xemacs
