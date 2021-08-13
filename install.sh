#!/bin/bash

dotfiles="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
olddotfiles=~/.dotfiles_old
files=".gitconfig"

echo -n "Backup existing dotfiles in $olddotfiles ..."
mkdir -p $olddotfiles
echo "done"

cd $dotfiles
for file in $files; do
  mv ~/$file $olddotfiles/
  echo "Symlinking $file ..."
  ln -s $dotfiles/$file ~/$file
done

