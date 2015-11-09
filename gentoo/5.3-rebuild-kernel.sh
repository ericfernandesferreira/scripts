#!/bin/sh

# Removendo o Kernel antigo
# cd /boot
# rm 
# 

# Recompilando o Kernel
cd /usr/src/linux
make mrproper
cp /home/backup/kernel/configs/grinder-gentoo2 /usr/src/linux/.config
make CFLAGS='"-march=haswell -O3 -pipe"' -j5 && make modules_install && make install

# Atualizando o Grub
grub2-mkconfig -o /boot/grub/grub.cfg

# Reempacotando
emerge -av @module-rebuild
eselect opengl set nvidia
eselect opencl set nvidia

# Após o kernel novo é bom verificar se existem algum programa do sistema com dependência do novo kernel
# emerge -av --update --deep --with-bdeps=y --newuse @world
