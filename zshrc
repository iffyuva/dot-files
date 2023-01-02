# zshrc customizations        -*- shell-script -*-

# detect machine first!
UNAME_S=`uname -s`

# most of the things are taken from hemant.
setopt correct

# Use Emacs keybinds
bindkey -e

PS1='%2~> '

setopt prompt_subst

autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
	colors
fi

PR_NOCOLOUR="%{$terminfo[sgr0]%}"
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval C_$color='$PR_NOCOLOR%{$terminfo[bold]$fg[${(L)color}]%}'
   eval CL_$color='$PR_NOCOLOR%{$fg[${(L)color}]%}'
done
C_NOCOLOUR="$PR_NOCOLOR%{$terminfo[sgr0]%}"


function precmd() {
   head_info=$(git symbolic-ref HEAD 2> /dev/null)
   rvm_use=$(rvm info|egrep -C 1 'homes'|grep 'gem'|cut -d\: -f 2|cut -d\" -f 2 )

   if [[ $rvm_use =~ 'not set' ]]; then
	   rvm_flag='system'
   else
	   rvm_flag=$rvm_use[(ws:/:)-1]
   fi

   RPROMPT='$C_RED$rvm_flag$C_NOCOLOUR'
   if [[ $head_info =~ '^refs*' ]]; then
      git_prefix="git:("
      git_suffix=")"
      git_status=""

	   branch_name=$head_info[(ws:/:)-1]
	   output=$(git diff-files --exit-code --quiet)

	   if [[ $? == 0 ]]; then
         git_status=">"
      else
         git_status="*"
      fi

	   PROMPT='%2~ \
$C_RED$git_prefix$C_GREEN$branch_name$C_RED$git_suffix$C_CYAN$git_status$C_NOCOLOUR '
   else
	   PROMPT='%2~> '
   fi
}

#history stuff
## Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

setopt hist_verify
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first

# completion related stuff
## fixme - the load process here seems a bit bizarre

setopt noautomenu
setopt complete_in_word
setopt always_to_end

unsetopt flowcontrol

WORDCHARS=''

autoload -U compinit
compinit

zmodload -i zsh/complist

## case-insensitive (all),partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
   zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
   unset CASE_SENSITIVE
else
   zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi

zstyle ':completion:*' list-colors ''

unsetopt MENU_COMPLETE
#setopt AUTO_MENU

# should this be in keybindings?
bindkey -M menuselect '^o' accept-and-infer-next-history

zstyle ':completion:*:*:*:*:*' menu yes select
# zstyle ':completion:*:*:*:*:processes' force-list always

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

# Load known hosts file for auto-completion with ssh and scp commands
if [ -f ~/.ssh/known_hosts ]; then
   zstyle ':completion:*' hosts $( sed 's/[, ].*$//' $HOME/.ssh/known_hosts )
   zstyle ':completion:*:*:(ssh|scp):*:*' hosts `sed 's/^\([^ ,]*\).*$/\1/' ~/.ssh/known_hosts`
fi
#end of completion related stuff

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

export PATH=/usr/local/bin:$PATH

export EDITOR='emacsclient'

# custom colors
# hate bold characters in ls or dir.
# if [ -e "$HOME/.dircolors" ]; then
#    eval `dircolors -b $HOME/.dircolors`
# fi


# export where actual dot-files exist
# this is a dirty-hack at present.
export MYDOTFILES=`dirname $(ls -al $HOME/.zshrc | cut -d'>' -f2)`

# finally enable all aliases.
if [ -e "$MYDOTFILES/shell.d/alias" ]; then
   source "$MYDOTFILES/shell.d/alias"
fi

# add texbin to $PATH
PATH=$PATH:/usr/texbin

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


# rvm stuff.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# pnpm
export PNPM_HOME="/Users/yuva/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end