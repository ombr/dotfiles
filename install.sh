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
  rm ~/$file
  echo ln -s $(pwd)/$file ~/$file
  ln -s $(pwd)/$file ~/$file
done;

# mkdir -p ˜/.vim/bundle/
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# vim +PluginInstall +qall

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
