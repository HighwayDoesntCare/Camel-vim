set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" options
"Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'scrooloose/nerdtree'
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

set noignorecase

set mouse=a

set selection=exclusive

set exrc

set secure

syntax enable
syntax on

colorscheme codedark
set t_Co=256
set smc=600  " to limit the regular expression of syntax color to avoid huge calculation

let g:airline_theme='sol'
hi! Normal ctermbg=NONE guibg=NONE
hi LineNr ctermfg=DarkGrey ctermbg=black
hi CursorLine cterm = NONE ctermbg=black
hi Visual cterm=bold ctermbg=DarkCyan ctermfg=White
hi Search cterm=bold ctermbg=DarkCyan ctermfg=White
hi MatchParen cterm=underline ctermbg=NONE ctermfg=DarkCyan
hi StatusLine ctermbg=White ctermfg=DarkGrey

set matchpairs+=<:>

nnoremap <C-k> kddpk
nnoremap <C-j> ddp
nnoremap <C-a> ggvG$
nnoremap <C-v><C-a> gg<C-v>G$
inoremap JJ <Esc>

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

let g:indentLine_enabled = 0

if exists('Camel')
	source ~/.vim/Camel.vim
endif
