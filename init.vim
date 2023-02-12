"General editor settings
set tabstop=4     
set nocompatible
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set ruler
set showcmd
"set incsearch
set shellslash
set number
set relativenumber
set mouse=a
"set termguicolors
set cino+=L0 
"set nohlsearch
set noswapfile
set updatetime=200
set encoding=utf-8
set laststatus=1
set title
syntax on
filetype indent on
filetype off
"setlocal indentkeys-=:

"Append template to new C++ files
autocmd BufNewFile *.cpp 0r ~/vimcp/Library/Template.cpp
"autocmd BufNewFile *.cpp execute "0r ~/vimcp/Library/".input("Your templates : (N)ormal, (C)ase, (G)en. Type one of them : ").".cpp"

"Compile and run
autocmd TermOpen * startinsert 
autocmd filetype cpp nnoremap <F9> :w <bar> !build.sh %:r <CR>
autocmd filetype cpp nnoremap <F10> :vsplit <bar> execute 'terminal ./%:r' <CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

"Plugin setup
call plug#begin(stdpath('data'))

Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'neoclide/coc-git'
Plug 'airblade/vim-gitgutter'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }
Plug 'altercation/vim-colors-solarized'

call plug#end()

filetype plugin indent on    
let g:solarized_degrade = 1
let g:solarized_termtrans = 1
let g:solarized_contrast=0

"Clipboard configuration
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
        augroup WSLYank
                    autocmd!
                            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
                                augroup END
                            endif
 
        au BufNewFile,BufRead *.tex
            \ set nocursorline |
            \ set nornu |
            \ set number |
            \ let g:loaded_matchparen=1 |

syntax on

" air-line
let g:airline_powerline_fonts = 0
let g:airline_theme = 'jellybeans'
let g:airline#extensions#wordcount#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty=''
let g:ycm_error_symbol = '>>'
let g:ycm_enable_diagnostic_signs = 0
let g:airline_solarized_dark_text = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline_solarized_dark_inactive_background=1
let g:airline_solarized_dark_inactive_border=1
"set t_Co=256
"set background=light
colorscheme jellybeans
"let g:solarized_visibility='low'
let g:bufferline_rotate=1
let g:bufferline_fixed_index=-1
let g:bufferline_echo = 0
let g:gitgutter_signs=0
"keybindings for { completion, "jk" for escape, ctrl-a to select all
imap jk <Esc>
map <C-a> <esc>ggVGy<CR>
"set belloff=all
