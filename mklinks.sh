#!/bin/sh
dir=/home/alex/dotfiles
files="zshrc aliases vimrc tmux.conf"

cd $dir

echo '...done'

for file in $files; 
do 
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file /home/alex/.$file
done

echo "Crating file .vbuf for vim."
touch /home/alex/.vbuf
