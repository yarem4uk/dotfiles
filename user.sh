#!/bin/sh
dir=~/dotfiles/files
files=$(ls $dir)
termite=~/.config/termite

cd $dir

for file in $files; 
do 
    if [[ $file = 'config' ]]; then
        mkdir $termite
        ln -s $dir/$file $termite/$file
        echo "Creating symlink $file for termite"
        continue
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo "Crating file .vbuf for vim."
touch ~/.vbuf
echo '... all done user'
