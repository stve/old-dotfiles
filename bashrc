# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# paths
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.3-53907/jars"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home/"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="$EC2_HOME/bin:$PATH"

# ec2
if [ -f "$HOME/.ec2/pk-*.pem" ]; then
  export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
fi
if [ -f "$HOME/.ec2/cert-*.pem" ]; then
  export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
fi

# autocompletion
source /usr/local/etc/bash_completion.d/git-completion.bash
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

# editors
export GIT_EDITOR="mate -wl1"
export SVN_EDITOR=mate_wait
export EDITOR='mate -w'

# jeweler
export JEWELER_OPTS="--shoulda --gemcutter"

# bash
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases ; fi
if [ -f ~/.bash_functions ]; then . ~/.bash_functions ; fi

# rvm
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
if [ -d ~/.rvm/bin ] ; then export PATH=$PATH:~/.rvm/bin ; fi
if [ -r ~/.rvm/scripts/completion ] ; then source ~/.rvm/scripts/completion ; fi

# prompt
bash_prompt
unset bash_prompt