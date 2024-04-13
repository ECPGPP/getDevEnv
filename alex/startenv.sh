#!/bin/sh
ALEXPATH="$HOME/git/Alex/"
TERMINALAPP="alacritty"
PRPL='\033[0;95m'
HPRPL='\033[0;105m'
NC='\033[0m'

printf "I ${PRPL}<3${NC} ECPGPP\n"

printf "${PRPL}Launching ${HPRPL} Alex devenv ${NC} -\n "
cd $ALEXPATH/usr/wcaw-alex-gabox/www
gulp & ${TERMINALAPP} --working-directory $ALEXPATH/wcaw-alex-docker -e make up & LASTPID=$!
wait $LASTPID
echo "$LASTPID docker logs alex-gabox" & ${TERMINALAPP} --working-directory $ALEXPATH/wcaw-alex-docker -T \(╯°□°\)╯︵_┻━┻_DEVALEX_docker_logs -e bash -c "docker ps -q | xargs -L 1 docker logs --follow"
