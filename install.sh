#!/bin/sh
#
# installs all the files to $HOME directory.

FILES="bash_profile bashrc dircolors emacs \
gitconfig"

# just create links in home directory!
for f in $FILES; do
   ln -s $(pwd)/$f $HOME/.$f
done

# well, nt-emacs can't recognize symbolic links :-(
UNAME_S=$(uname -s)
if [ "CYGWIN_NT-5.1" = "$UNAME_S" ]; then
   echo "removing .emacs and installing emacs"
   rm $HOME/.emacs
   cp $(pwd)/emacs $HOME/emacs
fi


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
