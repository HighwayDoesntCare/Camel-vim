set nocompatible
filetype off

filetype plugin indent on

set nu
set ruler

set showcmd
set showmatch

set autoindent
set cindent
set cino=g0,+0,+t0

set tabstop=4
set sw=4
set smarttab
set expandtab
set softtabstop=4
set matchtime=2
set formatoptions-=cro
set statusline=%<%f\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %P
set backspace=indent,eol,start

set hlsearch

set ignorecase

set mouse=a

set selection=exclusive

set exrc

set secure

syntax enable
syntax on

set matchpairs+=<:>

inoremap <C-k> <Esc>:w<CR>
nnoremap <C-k> :w<CR>

"function! AutoIndent()
"    startinsert
"    call feedkeys("\<CR>")
"    call feedkeys("\<Esc>")
"    call feedkeys("\<C-o>O")
"endfunction
"inoremap } }<Esc>:call AutoIndent()<CR>

"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap < <><left>
"inoremap { {}<left>
"inoremap }} {}<left><CR><C-o>O
inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

nnoremap + <C-w>>
nnoremap - <C-w><

command Qt tabclose

if exists('Camel')
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " options
    "Plugin 'Valloric/YouCompleteMe'
    Plugin 'rdnetto/YCM-Generator'
    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/syntastic'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'taglist.vim'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    Plugin 'Yggdroot/indentLine'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'YvesZHI/vim-code-dark'
    Plugin 'YvesZHI/vim-cpp-enhanced-highlight'
    Plugin 'vim-scripts/Conque-GDB'

    call vundle#end()
    if !exists('install')
        source ~/.vim/Camel.vim
    endif
endif

" The color settings must be at the end of file
hi! Normal ctermbg=NONE guibg=NONE
hi LineNr ctermfg=blue ctermbg=black
hi Visual cterm=bold ctermbg=blue ctermfg=Black
hi Search cterm=bold ctermbg=lightyellow ctermfg=Black
hi DiffAdd cterm=bold ctermbg=Red ctermfg=White
hi DiffDelete cterm=bold ctermbg=White ctermfg=Black
hi DiffText cterm=bold ctermbg=Yellow ctermfg=Black
hi DiffChange cterm=bold ctermbg=darkblue ctermfg=Black
hi MatchParen cterm=underline ctermbg=DarkCyan ctermfg=White
hi StatusLine ctermbg=White ctermfg=DarkGrey
hi Pmenu ctermbg=DarkGrey ctermfg=Yellow
set cursorline
hi CursorLine cterm=bold ctermbg=black
