#!/bin/bash

sudo pacman -Syu -p | grep 'linux' &> /dev/null

if [ $? == 0 ];then 
    echo YO IT CONTAINS LINUX UPDATE YO
fi
