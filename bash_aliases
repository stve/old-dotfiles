# aliases
alias ll='ls -l'
alias la='ls -A'
alias rm='rm -i'
alias cl='clear'
alias reload='source ~/.bashrc'
alias flush='memflush --servers=localhost'
alias disku='du -sh *'
alias diskd='du -sh'


# gems
alias gs='gem list | grep'
alias gl='gem list'


# bundler
alias be="bundle exec"

# rails
alias rr='touch tmp/restart.txt'
alias rf='rake features'
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"
alias routes="rake routes"

# testing
alias cuke="cucumber features"

# rake
alias rakeac="rake_cache"
alias rakeacc="rake_cache_clear"

# directories
alias xcode="open -a Xcode"

# git
alias gc='git clone'
alias gb='git branch'
alias rollup='rake git:rollup'
alias gpp='git pull && git push'
alias stash='git stash'

# mysql
alias start_mysql="/usr/local/Cellar/mysql/5.1.49/share/mysql/mysql.server start"
alias stop_mysql="/usr/local/Cellar/mysql/5.1.49/share/mysql/mysql.server stop"

# postgres
alias start_postgres="/usr/local/bin/pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias stop_postgres="/usr/local/bin/pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# redis
alias start_redis="redis-server /usr/local/etc/redis.conf"

# misc
alias start_starling="starling -P ~/run/starling.pid -q ~/run/spool"

# osx
alias dockspace="defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}' && killall Dock"