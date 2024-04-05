#!/bin/bash

ENDT="\e[0m"
HL="\e[1;35;40m"
AHL="\e[1;31;40m"
OKHL="\e[1;36;40m"
BGHL="\e[0;30;47m"
ALERT="\e[1;4;37;41m"

echo -e "${HL}---------------- YOLO UPDATE! ----------------${ENDT}" && 
	echo -e "${OKHL}---------- let's break your system! ----------${ENDT}"
	echo -e "${AHL}------------ doin' pacman cheese. ------------${ENDT}"
	sudo pacman -Syu -p | grep 'linux' &> /dev/null
	if [ $? == 0 ];then 
	    echo -e "${ALERT}!!! /!\ !  THAT CHEESE GONNA GO BOOM ! /!\ !!!${ENDT}"
	    echo -e "${ALERT}!!!!!! /!\ !  LINUX UPDATES AHEAD ! /!\ !!!!!!${ENDT}"
	fi
	sudo pacman -Syu && 
	echo -e "${OKHL}------ this is completely irresponsible ------${ENDT}"
	echo -e "${AHL}-------------- doin' yay cheese --------------${ENDT}"
	yay && 
	echo -e "${HL}That wasn't safe AT ALL my lord, but this was fun.${ENDT}"

#!/bin/bash

