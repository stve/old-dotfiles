# a nice function to send authorized keys to the server
# picked up from deploying rails applications ( pragprog.com)
# Usage: authme 123.45.67.89
function authme {
   ssh $1 'cat >> .ssh/authorized_keys' < ~/.ssh/id_rsa.pub
 }

function pidof { ps -Ac -o pid,command| egrep -i " $@\$" | awk '{print $1}'; }

function rvmrc {
  if [ $1 ]; then
    if [ $2 ]; then
      local command="--rvmrc --create use ${2}@${1}"
      rvm $command
    else
      local rvm_current=`rvm current`
      local command="--rvmrc --create use ${rvm_current}@${1}"
      rvm $command
    fi
  else
    echo "Usage: rvmrc <gemset name> <ruby version>"
  fi
}

# changing directory to code project or project dir
function cw {
  if [[ -z "$1" ]] ; then
    cd ~/Projects && cl;
  else
    cd ~/Projects/$1 && cl;
  fi
}

function _list_projects {
  local tasks=`ls ~/Projects`
  COMPREPLY=( $(compgen -W "${tasks}" -- $2) )
}

complete -F _list_projects -o default cw

function work {
  if [[ -z "$1" ]] ; then
    cd ~/Projects
  else
    cd ~/Projects/$1 && mate .
  fi
}

complete -F _list_projects -o default work

# from http://gist.github.com/180587
function psg {
  ps wwwaux | egrep "($1|%CPU)" | grep -v grep
}

# rake
# http://technotales.wordpress.com/2009/09/18/rake-completion-cache/
function rake_cache() {
  rake -T > .rake_t_cache
}

function rake_cache_clear() {
  if [ -e ".rake_t_cache" ]; then
    rm .rake_t_cache
  fi
}

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

function _check_rakefile() {
  if [ ! -e Rakefile ]; then
    return
  fi

  if [ -e ".rake_t_cache" ]; then
    local tasks=`cat .rake_t_cache | awk '{print $2}'`
  else
    local tasks=`rake --silent -T | awk '{print $2}'`
  fi

  COMPREPLY=( $(compgen -W "${tasks}" -- $2) )
}
complete -F _check_rakefile -o default rake

# rails
function sc () {
  if [ -f ./script/rails ]; then
    rails console $argv
  else
    ./script/console $argv
  fi
}

function db () {
  if [ -f ./script/rails ]; then
    rails dbconsole $argv
  else
    ./script/dbconsole $argv
  fi
}

# git
function __git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function __git_branch {
  __git_ps1 "%s"
}

function __present_git_branch {
  local branch=$(__git_branch)
  local dirty=$(__git_dirty)
  [ "$branch" != "" ] && echo "[$branch$dirty]"
}

# rvm
# set the ~/.rvm/bin/textmate_ruby to the current version we're using
# http://www.paperplanes.de/2009/12/3/making_textmate_and_rvm_play_nice.html
function rvmd() {
  rvm $1 --symlink textmate
}

function __my_rvm_ruby_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  local ruby_type=$(echo $RUBY_VERSION | awk -F'-' '{print $1}')
  local full="$ruby_type($version$gemset)"
  [ "$full" != "" ] && echo "$full "
}

function gemdir {
  if [[ -z "$1" ]] ; then
    cd `rvm gemdir`
    pwd
  else
    rvm "$1"
    cd `rvm gemdir`
    pwd
  fi
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
  PS1="$Y\$(__my_rvm_ruby_version)$G\h:$C\w $W\$(__present_git_branch)${NONE}$ "
}