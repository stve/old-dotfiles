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

# autocompletion
source /usr/local/etc/bash_completion.d/git-completion.bash
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

# git
function __git_dirty {
  git diff --quiet HEAD &>/dev/null
  [ $? == 1 ] && echo "*"
}

function __git_branch {
  __git_ps1 "%s"
}

function __present_git_branch {
  local branch=$(__git_branch)
  local dirty=$(__git_dirty)
  [ "$branch" != "" ] && echo "[$branch$dirty]"
}

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

# rvm version
function __my_rvm_ruby_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  local ruby_type=$(echo $RUBY_VERSION | awk -F'-' '{print $1}')
  local full="$ruby_type($version$gemset)"
  [ "$full" != "" ] && echo "$full "
}

# prompt
bash_prompt() {
  local NONE="\[\033[0m\]" # unsets color to term's fg color

  # regular colors
  local K="\[\033[0;30m\]" # black
  local R="\[\033[0;31m\]" # red
  local G="\[\033[0;32m\]" # green
  local Y="\[\033[0;33m\]" # yellow
  local B="\[\033[0;34m\]" # blue
  local M="\[\033[0;35m\]" # magenta
  local C="\[\033[0;36m\]" # cyan
  local W="\[\033[0;37m\]" # white

  # emphasized (bolded) colors
  local EMK="\[\033[1;30m\]"
  local EMR="\[\033[1;31m\]"
  local EMG="\[\033[1;32m\]"
  local EMY="\[\033[1;33m\]"
  local EMB="\[\033[1;34m\]"
  local EMM="\[\033[1;35m\]"
  local EMC="\[\033[1;36m\]"
  local EMW="\[\033[1;37m\]"

  # background colors
  local BGK="\[\033[40m\]"
  local BGR="\[\033[41m\]"
  local BGG="\[\033[42m\]"
  local BGY="\[\033[43m\]"
  local BGB="\[\033[44m\]"
  local BGM="\[\033[45m\]"
  local BGC="\[\033[46m\]"
  local BGW="\[\033[47m\]"

  local UC=$W # user's color
  [ $UID -eq "0" ] && UC=$R # root's color

  # PS1="$Y\$(__my_rvm_ruby_version)$W[$W\u@$C\h$W:$G\w$EMM\$(__git_branch)$EMR\$(__git_dirty)${NONE}]$ "
  # PS1="$W\$(__my_rvm_ruby_version)$G\h:$C\w $W[\$(__git_branch)\$(__git_dirty)]${NONE}$ "
  PS1="$W\$(__my_rvm_ruby_version)$G\h:$C\w $W\$(__present_git_branch)${NONE}$ "
}

bash_prompt
unset bash_prompt