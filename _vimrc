" Require newer version.
set nocompatible

" Turn on highlighting for all supported files.
syntax on

" Show the title.
set title

" Show line and column numbers.
set ruler

" Show matching bracket.
set showmatch

" Show matches as the user is typing.
set incsearch

" Highlight search results.
set hlsearch

" Make search case insensitive.
set ignorecase
" Override case insensitive search if upper-case letters are used.
set smartcase

" Convert tabs to spaces.
set expandtab
" Number of spaces used for indenting.
set shiftwidth=4
" Tab size in spaces.
set tabstop=4

" Turn off line wrapping.
set nowrap

" Turn on line numbers by default.
set number

" Show maximum line length limit.
set colorcolumn=80

" Turn off file type detection temporarily (for Vundle's sake).
filetype off

" Add Vundle to the runtime path. Start Vundle.
set rtp+=~/vimfiles/bundle/Vundle.vim/
set rtp+=~/vimfiles/vim-ycm-733de48-windows-x86/

let path='~/vimfiles/bundle'
call vundle#begin(path)
Plugin 'gmarik/Vundle.vim'
Plugin 'PProvost/vim-ps1'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()

filetype on
filetype plugin on
filetype indent on

if has("gui_running")
    colorscheme solarized 

    set background=dark

    " Turn on the horizontal scrollbar.
    set guioptions+=b
endif

if has("win32") || has("win64")
    let $dir = $TEMP . "\\\\"
    set dir=$dir
    set nobackup
    
    if has("gui_running")
        " Maximize window at start.
        au GUIEnter * simalt ~x

        set guifont=Monaco:h16
    endif
else
    set dir=~/tmp//
    set nobackup

    " TODO Figure out how to maximize window and set font.
endif

" Turn off bell for error messages.
set noerrorbells 

" Turn off bell on error.
set visualbell 
" Turn off flash on error.
set t_vb=

" UTF-8 items.
if has("multi_byte")
    set encoding=utf-8
    setglobal fileencoding=utf-8

    " Set to match Visual Studio. 
    " TODO Need to see what the effects of removing this are.
    setglobal bomb
endif

" Clear search results.
nnoremap <Leader>c :<C-u>nohlsearch<CR><C-l>

" Access buffers.
nnoremap <Leader>b :buffers<CR>:buffer<SPACE>

" Efficiency mappings.
inoremap jj <ESC>

" Change the current directory to the current file's directory.
autocmd BufEnter * silent! lcd %:p:h

" Change numbering to relative in certain cases.
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

