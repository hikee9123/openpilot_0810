#!/usr/bin/bash

export LD_LIBRARY_PATH=/data/data/com.termux/files/usr/lib
export HOME=/data/data/com.termux/files/home
export PATH=/usr/local/bin:/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/usr/sbin:/data/data/com.termux/files/usr/bin/applets:/bin:/sbin:/vendor/bin:/system/sbin:/system/bin:/system/xbin:/data/data/com.termux/files/usr/bin/python
export PYTHONPATH=/data/openpilot

cd /data/openpilot
ping -q -c 1 -w 1 google.com &> /dev/null
if [ "$?" == "0" ]; then
  BRANCH=$(git rev-parse --abbrev-ref HEAD)
  HASH=$(git rev-parse HEAD)
  /data/data/com.termux/files/usr/bin/git fetch
  REMOTE_HASH=$(git rev-parse --verify origin/$BRANCH)
  /data/data/com.termux/files/usr/bin/git pull


  if [ "$HASH" != "$REMOTE_HASH" ]; then
    if [ -f /EON ]; then
      chmod 777 /data/openpilot/installer/custom/install_gfortran.sh
      chmod 777 /data/openpilot/selfdrive/manager/custom_dep.py
      chmod 777 /data/openpilot/selfdrive/assets/addon/sh/gitcommit.sh
      chmod 777 /data/openpilot/selfdrive/assets/addon/sh/gitpull.sh
      chmod 777 /data/openpilot/selfdrive/assets/addon/sh/run_mixplorer.sh  
      reboot
    elif [ -f /TICI ]; then
      sudo chmod 777 /data/openpilot/selfdrive/assets/addon/sh/gitcommit.sh
      sudo chmod 777 /data/openpilot/selfdrive/assets/addon/sh/gitpull.sh
      sudo chmod 777 /data/openpilot/selfdrive/assets/addon/sh/run_mixplorer.sh  
      sudo reboot
    fi
    
  fi
fi