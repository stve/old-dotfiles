# a nice function to send authorized keys to the server
# picked up from deploying rails applications ( pragprog.com)
# Usage: authme 123.45.67.89
function authme {
   ssh $1 'cat >> .ssh/authorized_keys' < ~/.ssh/id_rsa.pub
 }

# changing directory to code project
function cw { cd ~/Projects/$1; }

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