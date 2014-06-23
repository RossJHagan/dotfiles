#! /bin/bash
sudo apt-get install git vim tmux zsh fontconfig python-pip

if ! type powerline 2> /dev/null; then
    pip install --user git+git://github.com/Lokaltog/powerline
fi

# For now temporarily put the powerline path into the PATH, this is accomplished by
# the .zshrc config on a more permanent basis but removing this will cause the
# command presence check to fail in ./install.sh
export PATH=~/.local/bin:$PATH

# install oh-my-zshell
if type wget 2> /dev/null; then
    wget --no-check-certificate http://install.ohmyz.sh -O - | sh
fi

if [ ! -f ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] ; then
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi
