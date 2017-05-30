#!/bin/sh

# Script que adiciona sudo e configura e adiciona usuário

groupadd sudo
echo "%sudo ALL=(ALL) ALL" >> /etc/sudoers
echo "Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"" >> /etc/sudoers
useradd -m -g users -G wheel,floppy,audio,video,cdrom,plugdev,power,netdev,lp,scanner,sudo -s /bin/bash eric

cp .bashrc /home/eric/.bashrc
cp .bashroot /root/.bashrc

passwd eric

installpkg bash-completion-2.2-noarch-3.txz

# Arrumando o blacklist do slackpkg
echo "[0-9]+alien" >> /etc/slackpkg/blacklist
echo "[0-9]+compat32" >> /etc/slackpkg/blacklist
echo "[0-9]+_xsb" >> /etc/slackpkg/blacklist
echo "fontconfig" >> /etc/slackpkg/blacklist
echo "freetype" >> /etc/slackpkg/blacklist
echo "cairo" >> /etc/slackpkg/blacklist
echo "audacious" >> /etc/slackpkg/blacklist
echo "audacious-plugins" >> /etc/slackpkg/blacklist
echo "gimp" >> /etc/slackpkg/blacklist
echo "gparted" >> /etc/slackpkg/blacklist
echo "gst-plugins-good" >> /etc/slackpkg/blacklist
echo "gst-plugins-good0" >> /etc/slackpkg/blacklist
echo "MPlayer" >> /etc/slackpkg/blacklist
echo "nasm" >> /etc/slackpkg/blacklist
