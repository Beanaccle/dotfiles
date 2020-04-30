#!/bin/zsh

for f in .??*
do
  [[ "$f" == ".gitignore" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue

  echo "$f"
done

source ~/dotfiles/.zshrc
