#!/bin/bash

hash gcc 2>/dev/null || { echo >&2 "gcc is not installed.  Aborting."; exit 1; }
hash cmake 2>/dev/null || { echo >&2 "cmake is not installed.  Aborting."; exit 1; }
hash make 2>/dev/null || { echo >&2 "make is not installed.  Aborting."; exit 1; }
hash python 2>/dev/null || { echo >&2 "python is not installed.  Aborting."; exit 1; }
hash git 2>/dev/null || { echo >&2 "git is not installed.  Aborting."; exit 1; }
hash vim 2>/dev/null || { echo >&2 "vim is not installed.  Aborting."; exit 1; }
hash autoreconf 2>/dev/null || { echo >&2 "automake is not installed.  Aborting."; exit 1; }
hash pkg-config 2>/dev/null || { echo >&2 "pkg-config is not installed.  Aborting."; exit 1; }
py_version=$(python --version 2>&1)
#py_version="Python 2.7.12"
if [[ ! ${py_version} =~ ^Python[[:space:]]2.* ]]; then
    echo >&2 "the version of python is not 2. Aborting."
    exit 1
fi
sudo apt install python-dev python-requests golang-go

mkdir ~/.vim 2>/dev/null

cp ./vimrc ~/.vimrc
cp ./ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
cp ./uncrustify.cfg ~/.vim/.uncrustify.cfg
cp ./uncrustify_K_and_R.cfg ~/.vim/.uncrustify_K_and_R.cfg
cp ./*.vim ~/.vim/

sed -i '/CStyle=1/c\' ~/.bashrc
#sed -i '/python=1/c\' ~/.bashrc
echo "alias vimc=\"vim --cmd 'let CStyle=1'\"" >> ~/.bashrc
#echo "alias vimpy=\"vim --cmd 'let python=1'\"" >> ~/.bashrc

rm -rf ctags
git clone https://github.com/universal-ctags/ctags.git
cd ctags && ./autogen.sh && ./configure && make -j8 && sudo make install && cd .. && rm -rf ctags

rm -rf uncrustify
git clone https://github.com/uncrustify/uncrustify.git
cd uncrustify && mkdir build && cd build && cmake .. && make && sudo make install && cd ../.. && rm -rf uncrustify

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd ~/.vim/bundle && git clone https://github.com/Valloric/YouCompleteMe.git
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/go/src/golang.org/x/tools && git clone https://github.com/golang/tools.git

cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive

cd ~/.vim/bundle && git clone https://github.com/embear/vim-uncrustify.git

~/.vim/bundle/YouCompleteMe/install.py --all

vim -E -c PluginInstall -c q -c q

echo "done."
