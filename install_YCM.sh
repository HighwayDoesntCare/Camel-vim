#!/bin/bash


cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive
rm -rf ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/cregex
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/go/src/golang.org/x/ && git clone https://github.com/golang/tools.git
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive

~/.vim/bundle/YouCompleteMe/install.py --all
