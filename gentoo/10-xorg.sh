#!/bin/sh

# Instalando o Xorg
echo "dev-libs/openssl bindist" >> /etc/portage/package.use
echo "media-libs/mesa gles1 xa -vaapi" >> /etc/portage/package.use
echo "sys-devel/llvm -static-analyzer" >> /etc/portage/package.use
echo "x11-terms/xterm toolbar" >> /etc/portage/package.use
echo "x11-libs/cairo xlib-xcb" >> /etc/portage/package.use
echo "x11-libs/libdrm libkms" >> /etc/portage/package.use
echo "x11-apps/mesa-progs egl" >> /etc/portage/package.use
echo "x11-drivers/nvidia-drivers gtk3" >> /etc/portage/package.use
echo "x11-drivers/nvidia-drivers ~amd64" >> /etc/portage/package.accept_keywords
emerge -av --verbose x11-base/xorg-drivers
emerge -av x11-apps/mesa-progs
emerge -av x11-base/xorg-server
env-update && source /etc/profile

# Instalando os drivers Nvidia
# Para reinstalar o modulo da Nvidia caso mude kernel
# Digite após compilar o novo kernel "make_prepare" "emerge @module-rebuild"
nvidia-xconfig --composite --cool-bits=12
eselect opengl set nvidia
eselect opencl set nvidia

# Instalando fontes
emerge -av media-fonts/droid
echo "media-fonts/roboto ~amd64" >> /etc/portage/package.accept_keywords
emerge -av media-fonts/roboto
emerge -av media-fonts/ubuntu-font-family
echo "media-fonts/corefonts tahoma" >> /etc/portage/package.use
emerge -av media-fonts/corefonts
emerge -av media-fonts/liberation-fonts

# Ajustando para Infinality Fonts
eselect fontconfig enable 52-infinality.conf
eselect infinality set infinality
eselect lcdfilter set infinality
eselect infinality list
eselect lcdfilter list

# Dando uma atualizada no sistema geral antes de prosseguir
echo "media-libs/freetype harfbuzz" >> /etc/portage/package.use
echo "1-) Trocar o bindist por -bindist do dev-libs/openssl"
echo "2-) Remover o -vaapi do media-libs/mesa"
echo "3-) Então digite emerge -avuND world"
env-update && source /etc/profile
