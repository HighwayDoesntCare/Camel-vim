CStyle-Python-vim-config
==========================


### Introduction ###
Install and configure the YouCompleteMe and some other plugins to build the vim environment for C/C++ project and for Python project.


### Installation ###
Execute `./install.sh`.<br>


### General Usage ###
Execute `source ~/.bashrc` after the installation to make `vimc` and `vimpy` work.<br>
Edit the line 59 to 61 of `ycm_extra_conf.py` to change the searching path of YCM.<br>
For C/C++ project, execute `vimc` at the root of project.<br>
For Python project, execute `vimpy` at the root of project.<br>
Why "at the root of project"? To ensure that searching or jumping in the project works as expected with the help of `.ycm_extra_conf.py` and `.tags` generated by executing `vimc` or `vimpy`.<br>



`:Q`:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; quit vim and all plugins, delete `.ycm_extra_conf.py` and `.tags` in the root of project<br>
`\tg`:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; open or close the window of taglist<br>
`\cc`:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; comment one line<br>
`\cm`:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; comment multi lines<br>
`\cu`:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uncomment<br>
`\vv`:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; search the word under cursor in project<br>
`F12`:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; jump to header file<br>
`<C-]>`:&nbsp;&nbsp;&nbsp; jump to declaration or to definition<br>
`g<C-]>`:&nbsp; jump to the only match or list multi matches<br>
`<C-o>`:&nbsp;&nbsp; go backword<br>
`<C-i>`:&nbsp;&nbsp; go forward<br>


### Some bugs ###
a) Downloading clang may fail while installing YCM. In this case, you need to download clang (`libclang-7.0.0-x86_64-unknown-linux-gnu.tar.bz2` for x86_64) manually from https://dl.bintray.com/micbou/libclang/ and put it into `~/.vim/bundle/YouCompleteMe/third_party/ycmd/clang_archives/`.<br>
b) On Mac OS, you need to install `ctags` with `brew` with the command: `brew install ctags`, and then add ``alias ctags="`brew --prefix`/bin/ctags"`` into the `~/.bashrc`.



### References ###
https://github.com/VundleVim/Vundle.vim (vim plugin manager)<br>
https://github.com/Valloric/YouCompleteMe<br>
https://github.com/rdnetto/YCM-Generator<br>
https://github.com/tpope/vim-pathogen (start YCM automatically while executing vim)<br>
https://github.com/scrooloose/nerdtree<br>
https://github.com/vim-syntastic/syntastic<br>
https://github.com/dkprice/vim-easygrep<br>
https://github.com/scrooloose/nerdcommenter<br>
https://github.com/vim-scripts/taglist.vim<br>
https://github.com/vim-scripts/Conque-GDB<br>
https://github.com/rstacruz/sparkup<br>
https://github.com/tpope/vim-fugitive<br>
