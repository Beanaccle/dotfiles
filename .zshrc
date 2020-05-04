# .zshrc
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit
prompt pure

alias be='bundle exec'
alias fig='docker-compose'
