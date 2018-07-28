#!/bin/sh
dir=~/dotfiles/files
files="zshrc aliases"

cd $dir

for file in $files; 
do 
    echo "Creating symlink to $file in root directory."
    ln -s $dir/$file /root/.$file
done

echo '...all done for root'
