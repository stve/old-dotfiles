# aliases
alias ll='ls -l'
alias la='ls -A'
alias rm='rm -i'
alias cl='clear'
alias reload='source ~/.bashrc'
alias flush='memflush --servers=localhost'

# rails
alias sc='script/console'
alias rr='touch tmp/restart.txt'
alias rf='rake features'
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"
alias db='script/dbconsole'

# directories
alias work='cd ~/Projects'
alias xcode="open -a Xcode"

# git
alias gb='git branch'
alias rollup='rake git:rollup'
alias gpp='git pull && git push'
alias gpa='git co master && git pull && git co staging && git pull && git co production && git pull && git co master'

# mysql
alias start_mysql="/usr/local/Cellar/mysql/5.1.41/share/mysql/mysql.server start"
alias stop_mysql="/usr/local/Cellar/mysql/5.1.41/share/mysql/mysql.server stop"