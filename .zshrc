export GPG_TTY=$(tty)
export PKG_CONFIG_PATH="/usr/local/opt/imagemagick@6/lib/pkgconfig"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
eval "$(nodenv init -)"

fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit
prompt pure

alias be='bundle exec'
alias fig='docker-compose'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
