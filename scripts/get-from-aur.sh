#!/bin/bash
PACKAGE=""
if [ $# -ge 1 ]; then
    PACKAGE="$1"
fi

if [ "$PACKAGE" != "" ]; then
    cd $HOME/aur/
    git clone "https://aur.archlinux.org/$PACKAGE.git"
    cd $PACKAGE
    makepkg -si
else
    echo "Enter an AUR package name"
fi
