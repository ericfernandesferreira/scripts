#!/bin/sh

# Criando seu profile

# Flavors
epro flavor desktop
# Mix-ins
epro mix-ins +audio +mate +media +X +mediadevice-base +mediadevice-video-consumer +mediaformat-video-common +mediaformat-audio-common +mediaformat-gfx-common
epro show

# Atualizando o sistema
emerge --sync
emerge -auDN world

# Vendo o que tem no @world
cat /var/lib/portage/world
