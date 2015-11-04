#!/bin/sh

# Script que adiciona sudo e configura e adiciona usuário

groupadd sudo
echo "%sudo ALL=(ALL) ALL" >> /etc/sudoers
echo "Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"" >> /etc/sudoers
useradd -m -g users -G wheel,floppy,audio,video,cdrom,plugdev,power,netdev,lp,scanner,sudo -s /bin/bash eric

cp .bashrc /home/eric/.bashrc
cp .bashroot /root/.bashrc

passwd eric

installpkg bash-completion-2.1-noarch-2.txz
