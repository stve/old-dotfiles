# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export INPUTRC="~/.inputrc"

# paths
export EC2_HOME="`brew --prefix ec2-api-tools`/jars"
export JAVA_HOME=`/usr/libexec/java_home`

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# path
export PATH="./.bundle/binstubs:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="$EC2_HOME/bin:$PATH"
export PATH="/usr/local/share/python:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"

export NODE_PATH="/usr/local/lib/node_modules"
export RBXOPT="-Xrbc.db=~/.rubinius"

# Source global definitions
[[ -s "/etc/bashrc" ]] && source "/etc/bashrc"

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
source `brew --prefix`/etc/bash_completion.d/git-prompt.sh
# source `brew --prefix`/etc/bash_completion.d/ack.bash_completion.sh

# history
# Don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# Ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# ssh
# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "~/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host\s" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# editors
export EDITOR="subl -n -w"
export GIT_EDITOR=$EDITOR
export SVN_EDITOR=$EDITOR
export BUNLDER_EDITOR="subl -n"

# bash
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases ; fi
if [ -f ~/.bash_functions ]; then . ~/.bash_functions ; fi

# prompt
export PROMPT_COMMAND="history -a"
bash_prompt
unset bash_prompt
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# direnv
eval `direnv hook $0`
