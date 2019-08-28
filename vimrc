set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" options
"Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'tpope/vim-pathogen'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'dkprice/vim-easygrep'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'taglist.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
Plugin 'tomasiser/vim-code-dark'

call vundle#end()


filetype on
filetype indent on
filetype plugin on
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

set hlsearch

set ignorecase

set mouse=a

set selection=exclusive

set exrc

set secure

syntax enable
syntax on

set background=dark
colorscheme codedark
hi! Normal ctermbg=NONE guibg=NONE
hi LineNr ctermfg=blue ctermbg=black
hi Visual cterm=bold ctermbg=DarkCyan ctermfg=White
hi Search cterm=bold ctermbg=DarkCyan ctermfg=White
hi MatchParen cterm=underline ctermbg=NONE ctermfg=DarkCyan
hi StatusLine ctermbg=White ctermfg=DarkGrey

set matchpairs+=<:>


nnoremap <C-k> kddpk
nnoremap <C-j> ddp
nnoremap <C-a> ggvG$
nnoremap <C-v><C-a> gg<C-v>G$


if exists('CStyle')
	source ~/.vim/CStyle.vim
endif

"if exists('python')
"	source ~/.vim/python.vim
"endif

