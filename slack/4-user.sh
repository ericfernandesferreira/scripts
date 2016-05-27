#!/bin/sh

# Script que adiciona sudo e configura e adiciona usuário

groupadd sudo
echo "%sudo ALL=(ALL) ALL" >> /etc/sudoers
echo "Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"" >> /etc/sudoers
useradd -m -g users -G wheel,floppy,audio,video,cdrom,plugdev,power,netdev,lp,scanner,sudo -s /bin/bash eric

cp .bashrc /home/eric/.bashrc
cp .bashroot /root/.bashrc

passwd eric

installpkg bash-completion-2.2-noarch-2.txz

# Arrumando o blacklist do slackpkg
echo "[0-9]+_SBo" >> /etc/slackpkg/blacklist
echo "[0-9]+_csb" >> /etc/slackpkg/blacklist
echo "[0-9]+_esb" >> /etc/slackpkg/blacklist
echo "[0-9]+_msb" >> /etc/slackpkg/blacklist
echo "[0-9]+_xsb" >> /etc/slackpkg/blacklist
echo "[0-9]+alien" >> /etc/slackpkg/blacklist
echo "[0-9]+compat32" >> /etc/slackpkg/blacklist
echo "fontconfig" >> /etc/slackpkg/blacklist
echo "freetype" >> /etc/slackpkg/blacklist
echo "cairo" >> /etc/slackpkg/blacklist

