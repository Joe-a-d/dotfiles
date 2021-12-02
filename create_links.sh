#!/bin/sh
for file in $HOME/.dotfiles/my_scripts/*; do
    cd /usr/local/bin
    ln -s $file "my_"$(basename "$file" .sh)
    chmod u+x "my_"$(basename "$file" .sh)
done

