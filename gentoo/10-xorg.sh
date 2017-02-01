#!/bin/sh

# Instalando o Xorg
echo "media-libs/libcaca -ruby" >> /etc/portage/package.use
echo "dev-libs/openssl bindist" >> /etc/portage/package.use
echo "media-libs/mesa gles1 -xa -d3d9 -vaapi -llvm -vdpau -gallium" >> /etc/portage/package.use
echo "sys-devel/llvm -static-analyzer" >> /etc/portage/package.use
echo "x11-terms/xterm toolbar Xaw3d" >> /etc/portage/package.use
echo "x11-libs/cairo xlib-xcb" >> /etc/portage/package.use
echo "x11-libs/libdrm libkms" >> /etc/portage/package.use
echo "x11-apps/mesa-progs egl" >> /etc/portage/package.use
echo "x11-drivers/nvidia-drivers gtk2" >> /etc/portage/package.use
echo "app-arch/libarchive lz4" >> /etc/portage/package.use
echo "dev-scheme/guile networking" >> /etc/portage/package.use
echo "dev-libs/cyrus-sasl -openldap -gdbm" >> /etc/portage/package.use
echo "net-misc/curl rtmp ssh" >> /etc/portage/package.use
echo "dev-db/sqlite tools" >> /etc/portage/package.use
echo "sys-apps/openrc tools" >> /etc/portage/package.use
echo "sys-libs/gdbm berkdb" >> /etc/portage/package.use
echo "media-video/nvidia_video_sdk tools" >> /etc/portage/package.use
echo "x11-drivers/nvidia-drivers ~amd64" >> /etc/portage/package.accept_keywords
echo "media-video/nvidia_video_sdk ~amd64" >> /etc/portage/package.accept_keywords

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
echo "media-fonts/droid ~amd64" >> /etc/portage/package.accept_keywords
emerge -av media-fonts/droid
echo "media-fonts/roboto ~amd64" >> /etc/portage/package.accept_keywords
emerge -av media-fonts/roboto
echo "media-fonts/ubuntu-font-family ~amd64" >> /etc/portage/package.accept_keywords
emerge -av media-fonts/ubuntu-font-family
echo "media-fonts/corefonts tahoma" >> /etc/portage/package.use
echo "media-fonts/corefonts ~amd64" >> /etc/portage/package.accept_keywords
echo "media-fonts/liberation-fonts ~amd64" >> /etc/portage/package.accept_keywords
emerge -av media-fonts/corefonts
emerge -av media-fonts/liberation-fonts

# Ajustando para Infinality Fonts
eselect fontconfig enable 52-infinality.conf
eselect infinality set infinality
eselect lcdfilter set infinality
eselect infinality list
eselect lcdfilter list

# Adicionando partição para suspender/hibernar
echo /dev/sda2 > /sys/power/resume

# Dando uma atualizada no sistema geral antes de prosseguir
echo "media-libs/freetype harfbuzz" >> /etc/portage/package.use
echo "1-) Trocar o bindist por -bindist do dev-libs/openssl"
echo "2-) Remover o -vaapi do media-libs/mesa"
echo "3-) Então digite emerge -avuND world"
env-update && source /etc/profile
