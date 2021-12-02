" Solarized
syntax enable
set background=dark
colorscheme solarized

" git commits spell checking and wrapping
autocmd Filetype gitcommit setlocal spell textwidth=72

"Man pages
runtime! ftplugin/man.vim

" Layout
set ls=2
"set textwidth=100
set columns=100
set colorcolumn=100
" set expandtab :: Uncomment to read tabs as spaces
set splitright splitbelow
" tabs to spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" for YML : set indentation to 2 spaces and expand tab to spaces
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"""Set statusline
set laststatus=2
set statusline=
set statusline+=%F
set statusline+=%=
set statusline+=%P
set statusline+=\
set statusline+=%l
set statusline+=:
set statusline+=:
set statusline+=%c
set statusline+=\
set statusline+=%y

" Custom Bindings
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap  $
nnoremap   ^

" UI
set nocompatible
set number relativenumber
"shows typed commands bottom-leftCorner
set showcmd
set wildmenu
set showmatch
set foldmethod=indent

" Search
" highlights search patterns
set hlsearch
set incsearch

" spell check
:set spell spelllang=en

" AEL Linter mods
" adapted from https://www.arthurkoziel.com/setting-up-vim-for-yaml/
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
"silent! helptags ALL
