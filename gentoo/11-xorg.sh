#!/bin/sh

# Instalando o Xorg
echo "app-arch/libarchive -lz4" >> /etc/portage/package.use
echo "dev-libs/openssl bindist" >> /etc/portage/package.use
echo "media-libs/mesa gles1 gles2 -vaapi" >> /etc/portage/package.use
echo "sys-devel/llvm LLVM_TARGETS: -AMDGPU -NVPTX" >> /etc/portage/package.use
echo "sys-devel/clang LLVM_TARGETS: -AMDGPU -NVPTX" >> /etc/portage/package.use

echo "# Xorg" >> /etc/portage/package.accept_keywords
echo "media-libs/* ~amd64" >> /etc/portage/package.accept_keywords
echo "x11-libs/libdrm ~amd64" >> /etc/portage/package.accept_keywords
echo "x11-libs/libxcb ~amd64" >> /etc/portage/package.accept_keywords
echo "dev-libs/libebml ~amd64" >> /etc/portage/package.accept_keywords
echo "x11-base/xcb-proto ~amd64" >> /etc/portage/package.accept_keywords

emerge -av x11-base/xorg-drivers
emerge -av x11-apps/mesa-progs
emerge -av x11-base/xorg-server
env-update && source /etc/profile

# Instalando o Vulkan
echo "dev-util/peg ~amd64" >> /etc/portage/package.accept_keywords
echo "dev-util/glslang ~amd64" >> /etc/portage/package.accept_keywords
echo "dev-util/spirv-tools ~amd64" >> /etc/portage/package.accept_keywords
echo "dev-util/spirv-headers ~amd64" >> /etc/portage/package.accept_keywords
echo "dev-util/vulkan-tools ~amd64" >> /etc/portage/package.accept_keywords
echo "dev-util/vulkan-headers ~amd64" >> /etc/portage/package.accept_keywords

emerge -av dev-util/vulkan-headers dev-util/vulkan-tools media-libs/vulkan-layers media-libs/vulkan-loader
eselect opencl set 2

# Instalando fontes
echo "media-fonts/* ~amd64" >> /etc/portage/package.accept_keywords
emerge -av media-fonts/droid
emerge -av media-fonts/roboto
emerge -av media-fonts/ubuntu-font-family
emerge -av media-fonts/dejavu
emerge -av media-fonts/corefonts
emerge -av media-fonts/liberation-fonts
emerge -av media-fonts/urw-fonts
emerge -av media-fonts/font-bitstream-100dpi

# Ajustando para Infinality Fonts
eselect fontconfig enable 52-infinality.conf
eselect infinality set infinality
eselect lcdfilter set infinality
eselect infinality list
eselect lcdfilter list

# Colocando o teclado correto no Xorg
cp /home/backup/scripts/gentoo/10-keyboard.conf /etc/X11/xorg.conf.d/

# Dando uma atualizada no sistema geral antes de prosseguir
echo "media-libs/libwebp -tiff" >> /etc/portage/package.use
echo "media-libs/freetype harfbuzz" >> /etc/portage/package.use
echo "1-) Remover o -vaapi do media-libs/mesa"
echo "2-) Remover o bindist do dev-libs/openssl"
echo "3-) Então digite emerge -avuND world"
env-update && source /etc/profile
