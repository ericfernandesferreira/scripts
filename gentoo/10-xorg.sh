#!/bin/sh

# Instalando o Xorg
echo "media-libs/mesa gles1 -gallium -llvm" >> /etc/portage/package.use
echo "dev-libs/openssl bindist" >> /etc/portage/package.use
echo "x11-drivers/nvidia-drivers gtk3" >> /etc/portage/package.use
echo "x11-drivers/nvidia-drivers ~amd64" >> /etc/portage/package.accept_keywords
emerge -av --verbose x11-base/xorg-drivers
emerge -av x11-apps/mesa-progs
emerge -av x11-base/xorg-server
env-update && source /etc/profile

# Instalando os drivers Nvidia
# Para reinstalar o modulo da Nvidia caso mude kernel "emerge @module-rebuild"
# e make_prepare
nvidia-xconfig --composite --cool-bits=12
eselect opengl set nvidia
eselect opencl set nvidia

# Ajustando para Infinality Fonts
eselect fontconfig enable 52-infinality.conf
eselect infinality set infinality
eselect lcdfilter set infinality
eselect infinality list
eselect lcdfilter list

# Instalando fontes
emerge -av media-fonts/droid
emerge -av media-fonts/roboto
emerge -av media-fonts/ubuntu-font-family
echo "media-fonts/corefonts tahoma" >> /etc/portage/package.use
emerge -av media-fonts/corefonts
emerge -av media-fonts/liberation-fonts

# Dando uma atualizada no sistema geral antes de prosseguir
# emerge -avuND world
env-update && source /etc/profile
