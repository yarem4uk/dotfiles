#!/bin/sh
dir=$(pwd)
files="zshrc aliases"

cd $dir

echo '...done'

for file in $files; 
do 
    echo "Creating symlink to $file in root directory."
    ln -s $dir/$file /root/.$file
done
