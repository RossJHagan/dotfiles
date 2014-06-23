#! /bin/bash
sudo apt-get install git vim tmux zsh fontconfig python-pip

if ! type powerline 2> /dev/null; then
    pip install --user git+git://github.com/Lokaltog/powerline
fi
