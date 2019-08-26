#!/bin/bash


set -e

hash gcc 2>/dev/null || { echo >&2 "gcc is not installed.  Aborting."; exit 1; }
hash cmake 2>/dev/null || { echo >&2 "cmake is not installed.  Aborting."; exit 1; }
hash make 2>/dev/null || { echo >&2 "make is not installed.  Aborting."; exit 1; }
hash python 2>/dev/null || { echo >&2 "python is not installed.  Aborting."; exit 1; }
hash python-config 2>/dev/null || { echo >&2 "python-dev is not installed.  Aborting."; exit 1; } # use python-config to check if python-dev is installed or not
hash git 2>/dev/null || { echo >&2 "git is not installed.  Aborting."; exit 1; }
hash vim 2>/dev/null || { echo >&2 "vim is not installed.  Aborting."; exit 1; }
hash autoreconf 2>/dev/null || { echo >&2 "automake is not installed.  Aborting."; exit 1; }
hash pkg-config 2>/dev/null || { echo >&2 "pkg-config is not installed.  Aborting."; exit 1; }
hash ctags 2>/dev/null || { echo >&2 "ctags is not installed.  Aborting."; exit 1; }
py_version=$(python --version 2>&1)
#py_version="Python 2.7.12"
if [[ ! ${py_version} =~ ^Python[[:space:]]2.* ]]; then
    echo >&2 "the version of python is not 2.  Aborting."
    exit 1
fi
if ! python -c "import requests" &> /dev/null; then
    echo >&2 "python-requests is not installed.  Aborting."
    exit 1
fi

echo "YCM can support golang only if golang with the minimum version 1.11 has been installed. Otherwise, YCM can not support golang."
while true; do
    read -r -p "Continue? [Y/n] " input
    case $input in
        [yY][eE][sS]|[yY])
            break
            ;;
        [nN][oO]|[nN])
            echo 'Abort.'
            exit 1
            ;;
        *)
            echo "Invalid input..."
            ;;
    esac
done


rm -rf ~/.vim ~/.vimrc
mkdir ~/.vim 2>/dev/null

cp ./vimrc ~/.vimrc
cp ./ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
cp ./clang-format.conf ~/.vim/.clang-format
cp ./*.vim ~/.vim/

sed -i '/CStyle=1/c\' ~/.bashrc
#sed -i '/python=1/c\' ~/.bashrc
echo "alias vimc=\"vim --cmd 'let CStyle=1'\"" >> ~/.bashrc
#echo "alias vimpy=\"vim --cmd 'let python=1'\"" >> ~/.bashrc


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd ~/.vim/bundle && git clone https://github.com/Valloric/YouCompleteMe.git
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive
rm -rf ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/cregex
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/go/src/golang.org/x/ && git clone https://github.com/golang/tools.git
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive

~/.vim/bundle/YouCompleteMe/install.py --all

vim -E -c PluginInstall -c q -c q


version=$(clang-format --version 2>/dev/null)
found=$?
if [[ ${found} == 0 ]]; then
    res=$(echo $version | cut -d " " -f 3 | cut -d "." -f 1)
fi
if [[ ${found} != 0 || ${res} < 5 ]]; then
    echo "clang-format with the minimum version 5.0 is necessary to format code. Otherwise, the formatter can not work."
    read -n 1 -s -r -p "Press any key to continue...";
fi


echo "Done."
