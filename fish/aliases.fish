alias e='nvim'
alias r='ruby'

if which hub > /dev/null
  alias g='hub'
else
  alias g='git'
end
alias d='docker'

alias ll='ls -lAh'
alias df='df -m'

alias bi="bundle install"
alias bu='bundle update'
alias be='bundle exec'

alias docker-stop-all-ps='docker stop (docker ps -a -q)'
alias docker-rm-all-ps='docker rm (docker ps -a -q)'
