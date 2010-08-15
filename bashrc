#!/bin/bash

# play with PS1
export PS1="yuva $ "

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
