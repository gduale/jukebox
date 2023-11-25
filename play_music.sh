#!/bin/bash

# on met une carte : ça joue la musique
# si on retire cette carte la musique s'arrête

current_code=""
dossier=$(dirname $(readlink -f "$0"))


while true
do
  code=$(nfc-list|grep UID|awk -F ':' '{print $2}'|sed 's/ //g')

  # test si le badge n'est plus présent
  if [[ $code == "" ]];then
    pkill mplayer
  fi

  player=$(ps ax | grep [m]player)

  if [[ $code != "" ]] && [[ $player == "" ]]; then
    ligne=$(grep $code ${dossier}/cards.csv)
    song=$(echo "$ligne" | awk -F ';' '{print $2}')
    mplayer -really-quiet "${dossier}/mp3/$song" &
  fi

  sleep 1
done
