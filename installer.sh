#!/bin/zsh

DOTPATH=~/local/Beanaccle/dotfiles

for f in .??*
do
  [[ "$f" == ".gitignore" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue

  ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done

source ~/.zshrc
