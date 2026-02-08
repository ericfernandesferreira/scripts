#!/bin/sh

# Arrumando o fuso horário
cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# Arrumando o teclado
cp configs/90-keyboard-layout.conf /etc/X11/xorg.conf.d

# Definindo driver Intel (Xe ou i915)
cp configs/xe.conf /etc/modprobe.d

# Arrumando o xorg para Nvidia Prime
cp configs/prime-run /usr/bin
cp configs/80-nvidia-pm.rules /etc/udev/rules.d
cp configs/nvidia-options.conf /etc/modprobe.d
cp configs/00-fix-nvidia.conf /etc/X11/xorg.conf.d
echo "# Inicia o NVIDIA Persistenced Daemon
if [ -x /usr/bin/nvidia-persistenced ]; then
  /usr/bin/nvidia-persistenced --user root
fi" >> /etc/rc.d/rc.local

# Isolando da Nvidia de ser chamada em programas electrons
cp configs/vulkan_intel.sh /etc/profile.d

# Configs Extras - UDEV Rules
cp configs/10-mouse-powersave.rules /etc/udev/rules.d
cp configs/94-intel-thunderbolt.rules /etc/udev/rules.d
cp configs/95-intel-wifi.rules /etc/udev/rules.d
cp configs/96-samsung-nvme.rules /etc/udev/rules.d
cp configs/97-vm-writeback.rules /etc/udev/rules.d
cp configs/98-realtek-ethernet.rules /etc/udev/rules.d
cp configs/99-intel-cpu-epp.rules /etc/udev/rules.d
cp configs/99-pcie-aspm.rules /etc/udev/rules.d
