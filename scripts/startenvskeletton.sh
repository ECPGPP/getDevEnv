#!/bin/bash
WORKDIR="$HOME/git/reverse814-server/"
PROJECT="reverse814-server"
TERMAPP="alacritty"
HPRPL="\033[1;7m"
PRPL="\033[0;95m"
NC="\033[0;m"

printf "I ${PRPL}<3${NC} ECPGPP\n"
printf ">${PRPL}Launching ${HPRPL}${PROJECT} dev env:${NC}\n"

# start new term in workdir and launch php server
cd ${WORKDIR}
${TERMAPP}


