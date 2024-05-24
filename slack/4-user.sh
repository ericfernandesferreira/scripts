#!/bin/sh

# Script que adiciona sudo e configura e adiciona usuário

groupadd sudo
echo "%sudo ALL=(ALL) ALL" >> /etc/sudoers
echo "Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"" >> /etc/sudoers
useradd -m -g users -G wheel,floppy,audio,video,input,cdrom,plugdev,power,netdev,lp,scanner,sudo -s /bin/bash eric

cp configs/.bashrc /home/eric/.bashrc
cp configs/.bashroot /root/.bashrc

passwd eric

slackpkg install bash-completion

# Arrumando o blacklist do slackpkg
echo "[0-9]+_xsb" >> /etc/slackpkg/blacklist
echo "audacious" >> /etc/slackpkg/blacklist
echo "audacious-plugins" >> /etc/slackpkg/blacklist
echo "gimp" >> /etc/slackpkg/blacklist
echo "gparted" >> /etc/slackpkg/blacklist
echo "MPlayer" >> /etc/slackpkg/blacklist
echo "manson" >> /etc/slackpkg/blacklist
echo "ffmpeg" >> /etc/slackpkg/blacklist
echo "fluidsynth" >> /etc/slackpkg/blacklist
echo "openal-soft" >> /etc/slackpkg/blacklist

# Arrumando a greylist do slackpkg+
echo "gst-plugins-good" >> /etc/slackpkg/greylist
echo "gst-plugins-bad-free" >> /etc/slackpkg/greylist
echo "pipewire" >> /etc/slackpkg/greylist
echo "pulseaudio" >> /etc/slackpkg/greylist
