#!/bin/sh


mkdir ~/.vim 2>/dev/null

cp ./vimrc ~/.vimrc
cp ./ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
cp ./uncrustify.cfg ~/.vim/.uncrustify.cfg
cp ./*.vim ~/.vim/

sed -i '/CStyle=1/c\' ~/.bashrc
sed -i '/python=1/c\' ~/.bashrc
echo "alias vimc=\"vim --cmd 'let CStyle=1'\"" >> ~/.bashrc
#echo "alias vimpy=\"vim --cmd 'let python=1'\"" >> ~/.bashrc

git clone https://github.com/universal-ctags/ctags.git
cd ctags && ./autogen.sh && ./configure && make -j8 && sudo make install && cd .. && rm -rf ctags

git clone https://github.com/uncrustify/uncrustify.git
cd uncrustify && mkdir build && cd build && cmake .. && make && sudo make install && cd ../.. && rm -rf uncrustify

wget https://mirrors.ustc.edu.cn/gnu/indent/indent-2.2.7.tar.gz
tar -xzvf indent-2.2.7.tar.gz
cd indent-2.2.7 && ./configure && make && sudo make install && cd .. && rm -rf indent-2.2.7*

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd ~/.vim/bundle && git clone https://github.com/Valloric/YouCompleteMe.git

cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive

cd ~/.vim/bundle && git clone https://github.com/embear/vim-uncrustify.git

~/.vim/bundle/YouCompleteMe/install.py --all

vim -E -c PluginInstall -c q -c q

echo "done."
