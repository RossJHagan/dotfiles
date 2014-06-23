Dotfiles
========

Just a work in progress basic development environment initialiser with a reasonable amount of customisability.  The install script
should be Bash compatible and run under bash.

Common aliases can go in to the `.common_aliases` file, to save duplication across bash/zsh.

Private contents can be put into a specific shell's `.<shell>_private` file.  [.bash_private|.zsh_private]

Run `[bash] ./install.sh`, run with `-h` for usage help.

Install programs
----------------

Pass in the `-i` flag to install.  Otherwise only dotfiles will be symlinked 
and the installation of programs left up to the user.

Pass the `-f` flag with a parameter of the files to include in symlink.

Basic Usage
-----------

**Vim**

To just get the .vimrc setup:

    [bash] ./install.sh -f .vimrc

Vundle will still need to be cloned down separately for `:PluginInstall` within Vim.

Custom Installer
----------------

For non-ubuntu-like systems, those where apt-get is not an option, 
then a custom install script can be written as `install_<osname>.sh`
then pass the <osname> in under the `-s` flag, to include that instead.

    [bash] ./install.sh -s gentoo

will look for the `install_gentoo.sh` script.
