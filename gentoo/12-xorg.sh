#!/bin/sh

# Instalando o Xorg
echo "sys-libs/binutils-libs -cet" > /etc/portage/package.use/binutils-libs
echo "x11-misc/colord argyllcms" > /etc/portage/package.use/colord
echo "net-print/cups openssl" > /etc/portage/package.use/cups
echo "x11-libs/gtk+ colord" > /etc/portage/package.use/gtk3
echo "media-libs/mesa -vulkan" > /etc/portage/package.use/mesa

emerge -av x11-base/xorg-drivers
env-update && source /etc/profile

# Instalando o Vulkan
echo "media-libs/vulkan-loader layers" > /etc/portage/package.use/vulkan-loader
echo "dev-util/vulkan-tools cube" > /etc/portage/package.use/vulkan-tools

emerge -av dev-util/vulkan-headers dev-util/vulkan-tools media-libs/vulkan-layers media-libs/vulkan-loader

# Instalando fontes
emerge -av media-fonts/droid
emerge -av media-fonts/roboto
emerge -av media-fonts/ubuntu-font-family
emerge -av media-fonts/dejavu
emerge -av media-fonts/corefonts
emerge -av media-fonts/liberation-fonts
emerge -av media-fonts/urw-fonts
emerge -av media-fonts/font-bitstream-100dpi

# Ajustando para Infinality Fonts
#eselect fontconfig enable 52-infinality.conf
#eselect infinality set infinality
#eselect lcdfilter set infinality
#eselect infinality list
#eselect lcdfilter list

# Colocando o teclado correto no Xorg
mkdir -p /etc/X11/xorg.conf.d
cp /home/backup/scripts/gentoo/10-keyboard.conf /etc/X11/xorg.conf.d/

# Dando uma atualizada no sistema geral antes de prosseguir
echo "media-libs/freetype harfbuzz" > /etc/portage/package.use/freetype
echo "net-misc/curl ssh" > /etc/portage/package.use/curl
echo "app-crypt/gpgme -qt5 -qt6" > /etc/portage/package.use/gpgme
echo "gui-libs/gtk colord" > /etc/portage/package.use/gtk4
echo "app-crypt/pinentry -qt5 -qt6" > /etc/portage/package.use/pinentry
echo "Digite emerge -avuND world"
env-update && source /etc/profile
