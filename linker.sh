#!/bin/bash

backup_dir="$HOME/dotfiles_old"
mkdir -p $backup_dir

for file in home/.[^.]*; do
  path="$(pwd)/$file"
  base=$(basename $file)
  target="$HOME/$base"
  backup="$backup_dir/$base"

  if [ ! -L "$target" -a -e "$target" ]; then
    echo ""
    echo "Backing up ~/$base"
    cp -rf $path $backup
  fi

  echo "Symlinking ~/$base"
  ln -nsf $path $target
done

function create_executables {
  for file in $1/*; do
    echo "Creating executable $file"
    chmod +x $file
  done
}

echo ""
create_executables "home/bin"
create_executables "home/.git_template/hooks"

echo ""
echo "Backups can be found in ~/dotfiles_old"

