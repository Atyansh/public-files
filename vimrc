" Remove strict vi compatibility
set nocompatible

" Show line number
set nu

" Proper indentation
set autoindent
set smartindent

" Text doesn't move to next line if screen too small
set nowrap

" Search works properly, case-insensitive unless specified
set ignorecase
set smartcase
set incsearch
set nohlsearch

" Backspace over anything
set backspace=indent,eol,start

" Open any format file or local config files
set fileformats=unix,dos,mac
set exrc

" No extra spaces
set nojoinspaces

" Show line and column number
set ruler

" Highlight matching brace
set showmatch

" Use spaces instead of tab and lazy backspacing for indentation
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set shiftround

" No error sounds
set noerrorbells
set novisualbell

" Show the mode
set modeline
set showmode

" Show syntax
syntax on

" Favorite colorscheme
:colors slate

" Tab completion works properly (UNIX Style) and shows menu of possible options.
set wildmenu
set wildmode=longest:full

" Better scrolling
set scrolloff=5

" No backups.
set nobackup
