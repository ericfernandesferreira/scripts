#!/bin/sh

# Instalando o xorg
emerge -av xorg-x11

# Arrumando o xorg e setando nvidia
nvidia-xconfig
eselect opengl set nvidia
eselect opencl set nvidia
