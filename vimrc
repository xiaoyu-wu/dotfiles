" put swap files into the following location
set directory^=$HOME/.vim/tmp//

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" To install Vundle, run command:
" git clone https://github.com/gmarik/Vundle.vim.git  ~/.vim/bundle/Vundle.vim
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" Pretty colors
Plugin 'morhetz/gruvbox'

" Python-mode!!!
"Plugin 'python-mode/python-mode'

" Enhanced python syntax highlighting
Plugin 'vim-python/python-syntax'
"Plugin 'sentientmachine/Pretty-Vim-Python'

"git interface
Plugin 'tpope/vim-fugitive'
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' 
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>

" Pythonic folding
Plugin 'tmhedberg/SimpylFold'

" Show docstring for folded code
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_docstring=0

" Auto-Indentation
Plugin 'vim-scripts/indentpython.vim'

" Autocomplete for Python (failed for now)
"Plugin 'davidhalter/jedi-vim'

call vundle#end()            " required
filetype plugin indent on    " required

autocmd vimenter * NERDTree

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

" spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
"au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
syntax on
let python_highlight_all=1

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

"Folding based on indentation:
"autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za
"----------Stop python PEP 8 stuff--------------

" Make it obvious where 79 characters is
set textwidth=79
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Display command at the last line
set showcmd

" Search: highlight, ignorecase, incsearch
set hlsearch
set ignorecase
set incsearch

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Show cursor line in the current line
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

colorscheme gruvbox
highlight Comment cterm=bold
