#!/bin/sh

# Atualizando a lista de apps
emerge --sync

# Escolhendo um perfil (Desktop selecionado) Padrao = 1
eselect profile list
eselect profile set 23
eselect profile list

# Configurando o Timezone
echo "Brazil/East" > /etc/timezone
emerge --config sys-libs/timezone-data

# Configurando os locais
echo "en_US ISO-8859-1" >> /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "pt_BR ISO-8859-1" >> /etc/locale.gen
echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
eselect locale list
eselect locale set 8
eselect locale list

env-update && source /etc/profile