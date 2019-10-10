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
version=$(clang-format --version 2>/dev/null)
found=$?
if [[ ${found} == 0 ]]; then
    res=$(echo $version | cut -d " " -f 3 | cut -d "." -f 1)
fi
if [[ ${found} != 0 || ${res} < 5 ]]; then
    echo "clang-format with the minimum version 5.0 is necessary to format code. Otherwise, the formatter can not work."
    echo "You can install the proper clang-format after the installation."
    #read -n 1 -s -r -p "Press any key to continue...";
fi
