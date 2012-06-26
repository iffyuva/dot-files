#!/bin/bash

# play with PS1
export PS1="yuva $ "

# export where actual dot-files exist
# this is a dirty-hack at present.
export MYDOTFILES=`dirname $(ls ~/.bashrc -al | cut -d'>' -f2)`

# nice trick from github
# parse /opt and update PATH, MANPATH
MYOPT=$HOME/opt
if [ -d $MYOPT ]; then
   for d in $(ls $MYOPT); do
       # update PATH with bin, sbin.
      if [ -d "$MYOPT/$d/bin" ]; then
         export PATH=$MYOPT/$d/bin:$PATH
      fi
      if [ -d "$MYOPT/$d/sbin" ]; then
         export PATH=$MYOPT/$d/sbin:$PATH
      fi

       # update MANPATH with share/man.
      if [ -d "$MYOPT/$d/share/man" ]; then
         export MANPATH=$MYOPT/$d/share/man:$MANPATH
      fi
   done
fi
export JAVA_HOME=/usr

# add android paths
export PATH=$HOME/android-sdk/android/tools:$PATH
export PATH=$HOME/android-sdk/android/platform-tools:$PATH

# add ec2 related env variables
export EC2_HOME=$HOME/.ec2
export PATH=$JAVA_HOME/bin:$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem`


# hate bold characters in ls or dir.
if [ -e "$HOME/.dircolors" ]; then
   eval `dircolors -b $HOME/.dircolors`
fi

# finally enable all aliases.
if [ -e "$MYDOTFILES/shell.d/alias" ]; then
   source "$MYDOTFILES/shell.d/alias"
fi

# rvm string.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
