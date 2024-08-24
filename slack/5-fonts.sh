#!/bin/sh

# Script que instala fontes webcore
cd /usr/share/fonts/TTF
tar xvf /home/backup/scripts/slack/configs/webcore-fonts.tar.gz
rm /etc/fonts/conf.d/60-liberation.conf

# Script que adiciona rgb e subpixel nas fontes
cd /etc/fonts/conf.d
ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf
ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf

# Setando modo infinality
echo export FREETYPE_PROPERTIES='"truetype:interpreter-version=38"' >> /etc/profile.d/freetype.sh

# Setando Clear Type
sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" -i /usr/include/freetype/freetype/config/ftoption.h
sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" -i /usr/include/freetype2/freetype/config/ftoption.h

fc-cache -fv
