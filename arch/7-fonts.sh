#!/bin/sh

# Script que instala as fontes Droid Sans e Ubuntu

cd /home/backup/fonts/Droid_Sans
cp * /usr/share/fonts/TTF/

cd /home/backup/fonts/Ubuntu-0.80
cp * /usr/share/fonts/TTF/

fc-cache -fv
