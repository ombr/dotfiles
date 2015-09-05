#!/bin/zsh
cd $(dirname $0)
for i in ./.*; do
  skip=false
  file="$(basename $i)"
  for ignore in ".git" "." ".." "old" "$(basename $0)" ".gitignore"; do
    if [ "$file" = ""$ignore ]; then
      skip=true
      break;
    fi;
  done;
  if $skip; then
    continue;
  fi;
  # rm ~/$file
  echo ln -s ~/dotfiles/$file ~/$file
  ln -s ~/dotfiles/$file ~/$file
done;

mkdir -p ˜/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
