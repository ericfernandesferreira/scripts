#!/bin/sh

# Ajustando o hostname
echo hostname='"gentoo"' > /etc/conf.d/hostname

# Configurando a Rede
emerge -av --noreplace net-misc/netifrc
echo config_eth0='"dhcp"' > /etc/conf.d/net
cd /etc/init.d
ln -s net.lo net.eth0
rc-update add net.eth0 default
