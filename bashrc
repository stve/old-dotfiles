# paths
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.3-41620/"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home/"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:$EC2_HOME/bin:$PATH"
export MANPATH=/opt/local/share/man:$MANPATH

# ec2
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"


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

alias work='cd ~/Projects'

# git
alias gb='git branch'
alias rollup='rake git:rollup'
alias gpp='git pull && git push'
alias gpa='git co master && git pull && git co staging && git pull && git co production && git pull && git co master'

# mysql
alias start_mysql="/usr/local/Cellar/mysql/5.1.38/share/mysql/mysql.server start"
alias stop_mysql="/usr/local/Cellar/mysql/5.1.38/share/mysql/mysql.server stop"

# brew
alias update_brew='cd /usr/local && git pull'

# rvm
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi