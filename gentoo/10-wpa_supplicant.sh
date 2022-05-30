# Primeiro vamos instalar o wpa_supplicant
echo "net-wireless/wpa_supplicant -ssl" >> /etc/portage/package.use

emerge -av net-wireless/wpa_supplicant

# Copiando a configuração do wpa_supplicant
cp /home/backup/scripts/gentoo/wpa_supplicant.conf /etc/wpa_supplicant/

# Adicionando o wpa_supplicant para rodar como serviço
rc-update add wpa_supplicant default

# Fazendo com que o script da rede use o wpa_supplicant
echo modules_wlan0='"wpa_supplicant"' >> /etc/conf.d/net
echo config_wlan0='"dhcp"' >> /etc/conf.d/net

# Adicionando seu SID e senha para conectar no Wi-Fi
wpa_passphrase GVT-2194 0097079248 >> /etc/wpa_supplicant/wpa_supplicant.conf

# Protegendo a senha
chmod 600 /etc/wpa_supplicant/wpa_supplicant.conf
