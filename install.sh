#!/bin/bash

dotfiles="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
olddotfiles=~/.dotfiles_old
files=".gitconfig"

if [ -d ~/.dotfiles_old ]; then
  echo "Backups already exist at $olddotfiles. I will not overwrite them. Exiting!"
  exit 1
fi

echo -n "Backup existing dotfiles in $olddotfiles ..."
mkdir -p $olddotfiles
echo "done"

cd $dotfiles
for file in $files; do
  mv ~/$file $olddotfiles/
  echo "Symlinking $file ..."
  ln -s $dotfiles/$file ~/$file
done

