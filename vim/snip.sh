#!/bin/sh
dir=~/dotfiles/vim
cd $dir
# files=$(find ~/dotfiles/vim -name '*snippets')
files=$(ls *snippets*)

for file in $files;
do
  echo "helo $file"
  echo "Creating symlink to $file in ~/.vim/UltiSnips"
  ln -s $dir/$file ~/.vim/UltiSnips/$file
done

echo '...all done'
