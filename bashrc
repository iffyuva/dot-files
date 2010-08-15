#!/bin/bash

# play with PS1
export PS1="yuva $ "

# export where actual dot-files exist
# this is a dirty-hack at present.
export MYDOTFILES=`dirname $(ls ~/.bashrc -al | cut -d'>' -f2)`

# nice trick from github
# parse /opt and update PATH, MANPATH
for d in $(ls /opt); do
   # update PATH with bin, sbin.
   if [ -d "/opt/$d/bin" ]; then
      export PATH=/opt/$d/bin:$PATH
   fi
   if [ -d "/opt/$d/sbin" ]; then
      export PATH=/opt/$d/sbin:$PATH
   fi

   # update MANPATH with share/man.
   if [ -d "/opt/$d/share/man" ]; then
      export MANPATH=/opt/$d/share/man:$PATH
   fi
done

# hate bold characters in ls or dir.
if [ -e "$HOME/.dircolors" ]; then
   eval `dircolors -b $HOME/.dircolors`
fi

# finally enable all aliases.
if [ -e "$MYDOTFILES/bash/alias" ]; then
   source "$MYDOTFILES/bash/alias"
fi
