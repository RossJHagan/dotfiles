#!/bin/bash

# Default configurations
dir=~/dotfiles
olddir=~/dotfiles_old
# Optionally override the files to be set up, e.g. ./install.sh -f .vimrc 
files=".bashrc .vimrc .zshrc .oh-my-zsh .tmux.conf .fonts .font-config"
viminit=true
sys="ubuntu"
noinstall=1

function usage () {
    cat <<EOF
Usage: $0 [-d source dotfiles dir] [-f dotfile list to apply ] [-o backup to old]
    -d  set a custom source directory for the dotfiles [~/dotfiles]
    -f  a list of the dotfiles to include in setup, overriding defaults
        Default: $files
    -o  where to put existing dotfiles for backup [~/dotfiles_old]
    -s  specify the system - currently accepts ubuntu
    -i  install all expected programs
}
EOF
    exit 0
}

# Loop the flags setting or overwriting defaults
while getopts d:o:f:s:ih opt; do
	case $opt in
	d)
		dir=$OPTARG
		;;
	o)
		olddir=$OPTARG
		;;
	f)
		files=$OPTARG
		;;
	s)
	    sys=$OPTARG
        ;;
    i)
        noinstall=0
        ;;
	h)  usage ;;
	\?) usage ;;
	esac
done

shift $(($OPTIND - 1))

if [ $noinstall -eq 0 -a -f "$dir/install_$sys.sh" ] ; then
    echo "Running installer"
    . $dir/install_ubuntu.sh
fi

# Expected Commands
# Print out any not present before exiting on absent
expectedCommands="zsh git vim tmux powerline"
allExpectedPresent=1 
for cmd in $expectedCommands ; do
    if ! type "$cmd" 2> /dev/null; then
        echo "$cmd is not present."
        allExpectedPresent=0
    fi
done
if [ $allExpectedPresent -eq 0 ] ; then
    echo "Non-existent command found. Exiting..."
    exit 0
fi

git config --global core.editor vim

#initialise Vundle folder
if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
    if [ ! type "git" > /dev/null ] ; then
        echo "Git is not installed for cloning Vundle."
        exit 0
    fi
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ ! -d "$olddir" ] ; then
    echo "Making $olddir"
    mkdir -p $olddir
fi

# Move into the source directory
cd $dir

for file in $files; do
    if [ -f ~/$file -a ! -h ~/$file ] ; then
        mv ~/$file $olddir
    fi
    if [ -h ~/$file ] ; then
        echo "Unlinking $file"
        unlink ~/$file
    fi
    if [ -f $dir/$file ] ; then
        echo "Symlinking from $dir/$file to $file"
        ln -s $dir/$file ~/$file
    fi
done
