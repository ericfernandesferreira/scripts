#!/bin/sh

# Várias configurações

# Criando o usuário
groupadd sudo
useradd -m -g wheel -G bin,daemon,audio,disk,network,power,storage,sys,video,sudo -s /bin/bash eric

echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
echo "%sudo ALL=(ALL) ALL" >> /etc/sudoers
echo "Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"" >> /etc/sudoers

cp .bashrc /home/eric/.bashrc

# Escolhendo um hostname
echo archlinux > /etc/hostname

# Escolhendo o fuso horário
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc --utc

# Gerando o a língua local
echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo LANG=pt_BR.UTF-8 > /etc/locale.conf
echo LANG=pt_BR.UTF-8 > /home/eric/.config/locale.conf

echo KEYMAP=br-abnt2 > /etc/vconsole.conf

# Baixando o GRUB o EFIBOOTMGR
pacman -S grub efibootmgr

# Criando o initramfs
mkinitcpio -p linux

# Senhas do root e usuario
passwd
passwd eric

# Instalando o Grub
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch --recheck
grub-mkconfig -o /boot/grub/grub.cfg

# Habilitando o dhcpcd
systemctl enable dhcpcd.service

exit
reboot
