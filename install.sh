#!/bin/sh
#
# installs all the files to $HOME directory.

FILES="bash_profile bashrc dircolors emacs"
for f in $FILES; do
   ln -s $(pwd)/$f $HOME/.$f
done
