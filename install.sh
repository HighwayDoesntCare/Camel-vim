#!/bin/bash


set -e

./check.sh

echo "YCM can support golang only if golang with the minimum version 1.11 has been installed. Otherwise, YCM can not support golang."
echo "Your ~/.vim and ~/.vimrc will be completely deleted to generate the new ones."
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
cp ./clang-format.conf ~/.vim/
cp ./*.vim ~/.vim/
cp -r ./templates ~/.vim/
cp -r ./after ~/.vim/

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


echo "Done."
