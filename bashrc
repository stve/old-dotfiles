# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# paths
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.3-46266/"
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

# shell
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"

# Git functions
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

source /usr/local/etc/bash_completion.d/git-completion.bash

# prompt

export PS1="$GREEN\h:$BLUE\W$WHITE\$(parse_git_branch)\$ "

# editors
export GIT_EDITOR=mate_wait
export SVN_EDITOR=mate_wait
export EDITOR=mate

if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases ; fi
if [ -f ~/.bash_functions ]; then . ~/.bash_functions ; fi
	
# rvm
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
if [ -d ~/.rvm/bin ] ; then export PATH=$PATH:~/.rvm/bin ; fi
	
# jeweler
export JEWELER_OPTS="--shoulda --gemcutter"