# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# paths
export EC2_HOME="`brew --prefix ec2-api-tools`/jars"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home/"

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="$EC2_HOME/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"

export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
export RBXOPT="-Xrbc.db=~/.rubinius"

# ec2
if [ -f "$HOME/.ec2/pk-*.pem" ]; then
  export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
fi
if [ -f "$HOME/.ec2/cert-*.pem" ]; then
  export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
fi

# autocompletion
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
source `brew --prefix`/etc/bash_completion.d/git-completion.bash

# editors
export GIT_EDITOR="mate -wl1"
export SVN_EDITOR=mate_wait
export EDITOR='mate -w'

# bash
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases ; fi
if [ -f ~/.bash_functions ]; then . ~/.bash_functions ; fi

# rvm
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
if [ -d ~/.rvm/bin ] ; then export PATH=$PATH:~/.rvm/bin ; fi
if [ -r ~/.rvm/scripts/completion ] ; then source ~/.rvm/scripts/completion ; fi

# prompt
export PROMPT_COMMAND="history -a"
bash_prompt
unset bash_prompt