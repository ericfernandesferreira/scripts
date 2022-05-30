#!/bin/sh

# Script que adiciona a língua portuguesa
echo "export LANG=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
echo "LANG=pt_BR.utf8" >> /home/eric/.profile

echo "setenv LANG pt_BR.UTF-8" >> /etc/profile.d/lang.csh
echo "LANG=pt_BR.utf8" >> /home/eric/.cshrc

sed -i '/^export LANG=en_US/ s/^/#/1' /etc/profile.d/lang.sh
sed -i '/^setenv LANG en_US/ s/^/#/1' /etc/profile.d/lang.csh

reboot
