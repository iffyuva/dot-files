#!/bin/bash

# play with PS1
export PS1="yuva $ "

# export where actual dot-files exist
# this is a dirty-hack at present.
export MYDOTFILES=`dirname $(ls -al ~/.bashrc | cut -d'>' -f2)`

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


# hate bold characters in ls or dir.
# if [ -e "$HOME/.dircolors" ]; then
#    eval `dircolors -b $HOME/.dircolors`
# fi

# finally enable all aliases.
if [ -e "$MYDOTFILES/shell.d/alias" ]; then
   source "$MYDOTFILES/shell.d/alias"
fi


# haskell ghc stuff
export PATH="${HOME}/.cabal/bin:${PATH}"


# nvm stuff
# do `nvm alias default iojs` so that nvm has default iojs version
export NVM_DIR="/Users/yuva/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"


# rvm string.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
