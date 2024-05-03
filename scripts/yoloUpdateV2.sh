#!/bin/bash

ENDT="\e[0m"
HL="\e[1;95m"
AHL="\e[1;37;41m"
OKHL="\e[1;34;47m"
ALERT="\e[1;4;37;41m"

HPRPL="\033[1;37;45m"
HBLU="\033[1;37;44m"
HYEL="\033[1;31m"
PRPL="\033[1;95m"
BLU="\033[1;94m"
YEL="\033[1;40m"
UND="\033[0;4m"
NC="\033[0;m"
INFO_USER="${YEL}Hit${NC}${HYEL} <Ctrl-D> ${NC}${YEL}when you're finished:${NC}"

printf "\n  ╔══════════════════ I ${PRPL}<3${NC} ECPGPP ════════Y═O═L═O══╗\n"
printf "  ║           ${PRPL}Welcome to ⨻ YOLO UPDATE ⨻${NC}           ║\n"
printf "  ║     ${PRPL}Update your system, make you regret it.${NC}    ║\n"
printf "  ╚═══Y═O═L═O══════════════════════════════════════╝\n"
printf "\n"
echo -e "  ${HL}---------------- (╯’□’)╯︵ ┻━┻ ---------------${ENDT}" && 
	echo -e "  ${OKHL}---------- let's break your system! ----------${ENDT}"
	echo -e "  ${AHL}------------ doin' pacman cheese. ------------${ENDT}"
	sudo pacman -Syu -p | grep 'linux' &> /dev/null
	if [ $? == 0 ];then 
	    echo -e "⨻⨻${ALERT}!!! /!\ !  THAT CHEESE GONNA GO BOOM ! /!\ !!!${ENDT}⨻⨻"
	    echo -e "⨻⨻${ALERT}!!!!!! /!\ !  LINUX UPDATES AHEAD ! /!\ !!!!!!${ENDT}⨻⨻"
	fi
	sudo pacman -Syu && 
	echo -e "  ${OKHL}------ this is completely irresponsible ------${ENDT}"
	echo -e "  ${AHL}-------------- doin' yay cheese --------------${ENDT}"
	yay && 
	echo -e "  ${HL}That wasn't safe AT ALL, but this was fun. ¯\_(ツ)_/¯${ENDT}"


