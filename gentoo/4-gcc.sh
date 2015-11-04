#!/bin/sh

# Atualizando o GCC
echo "sys-devel/gcc ~amd64" >> /etc/portage/package.accept_keywords
emerge -u sys-devel/gcc
gcc-config -l
gcc-config 2
gcc-config -l
env-update && source /etc/profile
emerge --oneshot libtool
gcc --version
emerge -C =sys-devel/gcc-4.8.5

# Comando para verificar o march adequado
# gcc -c -Q -march=native --help=target | grep march