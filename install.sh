#!/bin/zsh
cd $(dirname $0)

mkdir -p ~/.ssh
curl -sSL https://github.com/ombr.keys  > ~/.ssh/authorized_keys

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
rm -rf ~/.oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

rm -rf ~/.rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

rm -rf ~/.nvm
git clone https://github.com/creationix/nvm.git ~/.nvm
