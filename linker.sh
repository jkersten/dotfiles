#!/bin/bash

backup_dir="$HOME/dotfiles_old"
mkdir -p $backup_dir

for file in home/.[^.]*; do
  path="$(pwd)/$file"
  base=$(basename $file)
  target="$HOME/$base"
  backup="$backup_dir/$base"

  echo "Symlinking ~/home/$base to ~/$base"
  cp -rf $target $backup
  ln -nsf $path $target
done

function create_executables {
  for file in $1/*; do
    echo "Creating executable $file"
    chmod +x $file
  done
}

echo ""
create_executables "home/.git_template/hooks"
create_executables "home/bin"

echo ""
echo "Your old dotfiles have been backed up to ~/$(basename backup_dir)"
