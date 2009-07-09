#
export EC2_HOME=~/.ec2
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:$EC2_HOME/bin:$PATH"
export MANPATH=/opt/local/share/man:$MANPATH
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home/"

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

source /usr/local/bin/git-completion.sh

export PS1="$GREEN\h:$BLUE\W$WHITE\$(parse_git_branch)\$ "

# editors
export GIT_EDITOR=mate_wait
export SVN_EDITOR=mate_wait
export EDITOR=mate

# aliases
alias ll='ls -l'
alias la='ls -A'
alias rm='rm -i'
alias cl='clear'
alias reload='source ~/.bashrc'
alias rr='touch tmp/restart.txt'
alias rf='rake features'
alias flush='memflush --servers=localhost'

alias work='cd ~/work'
alias cdc='cd ~/work/coolspotters'
alias cds='cd ~/work/simplesports'
alias cdsi='cd ~/work/simplesports-iphone'
alias cdf='cd ~/work/fanzter'
alias cdfr='cd ~/work/fanzter-recipes'
alias cdfe='cd ~/work/fanzter-extras'
alias csce='cd ~/work/coolspotters-extras'

# git
alias gb='git branch'
alias rollup='rake git:rollup'
alias gpp='git pull && git push'
alias gpa='git co master && git pull && git co staging && git pull && git co production && git pull && git co master'

# mysql
alias start_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM start"
alias stop_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM stop"


