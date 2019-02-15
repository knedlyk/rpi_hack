#!/bin/bash

vcgencmd codec_enabled MPG2
vcgencmd codec_enabled WVC1

echo "Whould you like to hack your RPI (y/n):"
read ans

if [ "$ans" == "y" ]; then
  echo "Patching..."
  cd /boot 
  cp start.elf start.elf_backup && \
  perl -pne 's/\x47\xE9362H\x3C\x18/\x47\xE9362H\x3C\x1F/g' < start.elf_backup >
 start.elf 
  echo "Patched. Exiting..."
  echo "Whould you like to reboot? (y/n):"
  read ans 
  if [ "$ans" == "y" ]; then 
    systemctl reboot 
  else 
   exit 0
  fi
else
  echo "Exiting..."
  exit 0
fi
