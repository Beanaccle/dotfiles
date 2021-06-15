# .zshrc
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit
prompt pure

alias be='bundle exec'
alias fig='docker-compose'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
