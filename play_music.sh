#!/bin/bash 

# on met une carte : ça joue la musique
# si on retire cette carte la musique s'arrête

current_code=""
dossier=$(dirname $(readlink -f "$0"))


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
      mplayer -really-quiet "${dossier}/mp3/Ahlescrocodiles.mp3" &
    fi
    
    if [ $code == "d62caa1a" ];then 
      current_code="d62caa1a"
     mplayer -really-quiet "${dossier}/mp3/Bateau-sur-leau.mp3" &
    fi
    
    if [ $code == "d674101e" ];then 
      current_code="d674101e"
     mplayer -really-quiet "${dossier}/mp3/Dans-sa-maison-un-grand-cerf.mp3" &
    fi
    
    if [ $code == "d6bfc61a" ];then 
      current_code="d6bfc61a"
     mplayer -really-quiet "${dossier}/mp3/GerardDaltonlasorciereGrabouilla.mp3" &
    fi
    
    if [ $code == "62262d95" ];then 
      current_code="62262d95"
     mplayer -really-quiet "${dossier}/mp3/LuisFonsi-Despacitoft.DaddyYankee.mp3" &
    fi
    
    if [ $code == "e695c41a" ];then 
      current_code="e695c41a"
     mplayer -really-quiet "${dossier}/mp3/PeppaPigFrancais-BingBongZoo.mp3" &
    fi
  fi
  sleep 1
done
