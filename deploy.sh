#!/bin/bash
read -p 'are you sure?' var
[ "$var" != "y" ] && exit
cp ./vimrc ~/.vimrc
cp ./bashrc ~/.bashrc
cp ./zshrc ~/.zshrc
echo done
