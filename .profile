#
export EC2_HOME=~/.ec2
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:$EC2_HOME/bin:$PATH"
export EC2_PRIVATE_KEY="$EC2_HOME/pk-IE7JVLI5FN5SESWSUC3QFYTUXAKJINGW.pem"
export EC2_CERT="$EC2_HOME/cert-IE7JVLI5FN5SESWSUC3QFYTUXAKJINGW.pem"
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
alias gpp='git pull && git push'
alias gpa='git co master && git pull && git co staging && git pull && git co production && git pull && git co master'
alias start_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM start"
alias stop_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM stop"


