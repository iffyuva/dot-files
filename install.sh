#!/bin/sh
#
# installs all the files to $HOME directory.

FILES="bash_profile bashrc dircolors emacs \
gitconfig"

# just create links in home directory!
for f in $FILES; do
   ln -s $(pwd)/$f $HOME/.$f
done


# Helper taken from bash-completions to check for installed programs.
have()
{
   unset -v have
   PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin type $1 &>/dev/null &&
   have="yes"
}

# install texmf customizations.
# https://help.ubuntu.com/community/LaTeX
mkdir $HOME/texmf
cp -rf texmf $HOME/
have texhash && texhash $HOME/texmf
