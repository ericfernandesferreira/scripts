#!/bin/sh

# Ajustando o hostname
echo "gentoo" > /etc/hostname

# Configurando a Rede
emerge -av net-misc/dhcpcd
rc-update add dhcpcd default
rc-service dhcpcd start
emerge -av --noreplace net-misc/netifrc
echo config_eth0='"dhcp"' >> /etc/conf.d/net
cd /etc/init.d
ln -s net.lo net.eth0
rc-update add net.eth0 default
echo dns_domain_lo="com" > /etc/conf.d/net

# Ajustando o localhost
echo "# This defines the current system and must be set" > /etc/hosts
echo "127.0.0.1     gentoo.com gentoo localhost" >> /etc/hosts

