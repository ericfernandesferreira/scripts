#!/bin/sh

# Script que instala pacote de áudio do repositório

pacman -S faac faad2 ffmpeg fluidsynth json-c lame libcue libmp4v2 openal portaudio
pacman -S pulseaudio speex x264 xvidcore pulseaudio-alsa wavpack mpg123
