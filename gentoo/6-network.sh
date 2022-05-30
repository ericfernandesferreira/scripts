#!/bin/sh

# Ajustando o hostname
echo hostname='"gentoo"' > /etc/conf.d/hostname
echo dns_domain_lo="com" > /etc/conf.d/net
echo "# IPv4 and IPv6 localhost aliases" > /etc/hosts
echo "127.0.0.1	gentoo.com gentoo localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts

# Configurando a Rede
emerge -av --noreplace net-misc/netifrc
echo config_eth0='"dhcp"' >> /etc/conf.d/net
cd /etc/init.d
ln -s net.lo net.eth0
