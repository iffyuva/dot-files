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
      export MANPATH=/opt/$d/share/man:$MANPATH
   fi
done

# add android paths
export PATH=$HOME/android-sdk/android/tools:$PATH
export PATH=$HOME/android-sdk/android/platform-tools:$PATH

# add ec2 related env variables
export EC2_HOME=$HOME/.ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export JAVA_HOME=/usr/lib/jvm/java-6-sun


# hate bold characters in ls or dir.
if [ -e "$HOME/.dircolors" ]; then
   eval `dircolors -b $HOME/.dircolors`
fi

# finally enable all aliases.
if [ -e "$MYDOTFILES/bash.d/alias" ]; then
   source "$MYDOTFILES/bash.d/alias"
fi
