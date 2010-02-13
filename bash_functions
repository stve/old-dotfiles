# a nice function to send authorized keys to the server
# picked up from deploying rails applications ( pragprog.com)
# Usage: authme 123.45.67.89
function authme {
   ssh $1 'cat >> .ssh/authorized_keys' < ~/.ssh/id_rsa.pub
 }

# changing directory to code project or project dir
function cw { 
	if [[ -z "$1" ]] ; then
		cd ~/Projects
	else
		cd ~/Projects/$1; 
	fi
}

function _list_projects {
	local tasks=`ls ~/Projects`
  COMPREPLY=( $(compgen -W "${tasks}" -- $2) )
}

complete -F _list_projects -o default cw

# from http://gist.github.com/180587
function psg {
  ps wwwaux | egrep "($1|%CPU)" | grep -v grep
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

# from http://technotales.wordpress.com/2009/09/18/rake-completion-cache/
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


# from http://www.paperplanes.de/2009/12/3/making_textmate_and_rvm_play_nice.html
# set the ~/.rvm/bin/textmate_ruby to the current version we're using
function rvmd() {
  rvm $1 --symlink textmate
}



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