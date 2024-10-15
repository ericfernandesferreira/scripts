#!/bin/sh

# Instalando pacotes de audio e video
echo "media-plugins/alsa-plugins ffmpeg speex" > /etc/portage/package.use/audio/alsa-plugins
echo "media-libs/x264 opencl" > /etc/portage/package.use/audio/x264
echo "media-video/ffmpeg fontconfig libdrm openssl libaom nvenc openal opencl speex vdpau webp x265 lzma" > /etc/portage/package.use/audio/ffmpeg
echo "media-libs/openal -qt5 -sdl" > /etc/portage/package.use/audio/openal
echo "media-libs/libaom -examples" > /etc/portage/package.use/audio/libaom
echo "media-video/pipewire echo-cancel extra ffmpeg pipewire-alsa sound-server" > /etc/portage/package.use/audio/pipewire

emerge -av media-libs/libpulse media-sound/pulseaudio media-video/pipewire media-video/ffmpeg

# Adicionando seu usuário ao grupo pipewire
gpasswd -a eric pipewire
for x in pipewire ; do gpasswd -a eric $x ; done
