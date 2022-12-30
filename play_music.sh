#!/bin/bash 

set -x
# on met une carte : ça joue la musique
# si on retire cette carte la musique s'arrête

current_code=""
while true
do
  code=$(nfc-list|grep UID|awk -F ':' '{print $2}'|sed 's/ //g')

  echo "test si le badge n'est plus présent:"
  if [[ $code == "" ]];then
    pkill mplayer
    echo "ici on kill!"
  fi

  player=$(ps ax | grep [m]player)

  if [[ $code != "" ]] && [[ $player == "" ]]; then
    if [ $code == "e2ef8d0d" ];then 
      current_code="e2ef8d0d"
      mplayer -really-quiet "/home/gui/Musique/Ultrasyd - Atari Sucks.mp3" &
    fi
    
    if [ $code == "d62caa1a" ];then 
      current_code="d62caa1a"
     mplayer -really-quiet "/home/gui/Musique/Ultrasyd-Croissant[BLEEPSTREET]320kbps.mp3" &
    fi
  fi  
  sleep 1
done
