# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export INPUTRC="~/.inputrc"

# paths
export EC2_HOME="$(brew --prefix ec2-api-tools)/libexec"
export JAVA_HOME="$(/usr/libexec/java_home)"

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
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"

export NODE_PATH="/usr/local/lib/node_modules"
export RBXOPT="-Xrbc.db=~/.rubinius"

# history
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Source global definitions
[[ -s "/etc/bashrc" ]] && source "/etc/bashrc"

# ec2
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export AWS_RDS_HOME="/usr/local/Cellar/rds-command-line-tools/1.10.003/libexec"
export AWS_ELASTICACHE_HOME="/usr/local/Cellar/aws-elasticache/1.7.000/libexec"
export AWS_IAM_HOME="/usr/local/opt/aws-iam-tools/jars"
export AWS_CREDENTIAL_FILE=$HOME/.ec2/aws-credentials-master

# autocompletion
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
source `brew --prefix`/etc/bash_completion.d/git-completion.bash
source `brew --prefix`/etc/bash_completion.d/git-prompt.sh
# source `brew --prefix`/etc/bash_completion.d/ack.bash_completion.sh
source `brew --prefix`/etc/bash_completion.d/hub.bash_completion.sh

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

# direnv
eval "$(direnv hook bash)"

# added by travis gem
source ~/.travis/travis.sh
