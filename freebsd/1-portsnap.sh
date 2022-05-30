#!/bin/sh

# Utilizando o servidor "latest" para o pkg
install -Dm644 $CWD/configs/FreeBSD.conf /usr/local/etc/pkg/FreeBSD.conf

# Baixando o portsnap
portsnap fetch

# Extraíndo o portsnap
portsnap extract

# Atualizando o portsnap
portsnap fetch
portsnap update
portsnap fetch update
