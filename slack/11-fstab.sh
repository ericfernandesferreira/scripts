#!/bin/sh

# Script que adiciona discard,noatime no fstab

sed -i  '/^\/dev\/sda[567]/ s/defaults/&,discard,noatime,barrier=0/g' /etc/fstab

# Script que carrega módulos pelo rc.local

echo "modprobe coretemp" >> /etc/rc.d/rc.local
chmod +x /etc/rc.d/rc.local
