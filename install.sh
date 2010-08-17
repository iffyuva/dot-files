#!/bin/sh
#
# installs all the files to $HOME directory.

FILES="bash_profile bashrc dircolors emacs \
gitconfig"

# just create links in home directory!
for f in $FILES; do
   ln -s $(pwd)/$f $HOME/.$f
done
