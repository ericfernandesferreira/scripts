#!/bin/bash

echo -e "\n--- AUDITORIA DE ENERGIA (MAPA TOTAL DO HARDWARE) ---\n"
printf "%-35s | %-20s | %-10s\n" DISPOSITIVO CONTROLE STATUS
echo "----------------------------------------------------------------------"

# --- NÚCLEO DO SOC & PONTES (INFRAESTRUTURA) ---
printf "%-35s | %-20s | %-10s\n" "Host Bridge (00:00.0)" $(cat /sys/bus/pci/devices/0000:00:00.0/power/control) $(cat /sys/bus/pci/devices/0000:00:00.0/power/runtime_status)
printf "%-35s | %-20s | %-10s\n" "PCI Bridge NVMe (00:06.0)" $(cat /sys/bus/pci/devices/0000:00:06.0/power/control) $(cat /sys/bus/pci/devices/0000:00:06.0/power/runtime_status)
printf "%-35s | %-20s | %-10s\n" "PCI Bridge Ethernet (00:1c.3)" $(cat /sys/bus/pci/devices/0000:00:1c.3/power/control) $(cat /sys/bus/pci/devices/0000:00:1c.3/power/runtime_status)
printf "%-35s | %-20s | %-10s\n" "Intel GNA IA (00:08.0)" $(cat /sys/bus/pci/devices/0000:00:08.0/power/control) $(cat /sys/bus/pci/devices/0000:00:08.0/power/runtime_status)
printf "%-35s | %-20s | %-10s\n" "Intel Dynamic Tuning (00:04.0)" $(cat /sys/bus/pci/devices/0000:00:04.0/power/control) $(cat /sys/bus/pci/devices/0000:00:04.0/power/runtime_status)

# --- VÍDEO (HÍBRIDO) ---
printf "%-35s | %-20s | %-10s\n" "Intel Iris Xe GPU (00:02.0)" $(cat /sys/bus/pci/devices/0000:00:02.0/power/control) $(cat /sys/bus/pci/devices/0000:00:02.0/power/runtime_status)
printf "%-35s | %-20s | %-10s\n" "NVIDIA RTX 3060 (01:00.0)" $(cat /sys/bus/pci/devices/0000:01:00.0/power/control) $(cat /sys/bus/pci/devices/0000:01:00.0/power/runtime_status)
printf "%-35s | %-20s | %-10s\n" "NVIDIA Audio (01:00.1)" $(cat /sys/bus/pci/devices/0000:01:00.1/power/control) $(cat /sys/bus/pci/devices/0000:01:00.1/power/runtime_status)

# --- CONTROLADORES USB & THUNDERBOLT ---
printf "%-35s | %-20s | %-10s\n" "USB 3.2 Controller (00:14.0)" $(cat /sys/bus/pci/devices/0000:00:14.0/power/control) $(cat /sys/bus/pci/devices/0000:00:14.0/power/runtime_status)
printf "%-35s | %-20s | %-10s\n" "Thunderbolt Port #0 (00:07.0)" $(cat /sys/bus/pci/devices/0000:00:07.0/power/control) $(cat /sys/bus/pci/devices/0000:00:07.0/power/runtime_status)
printf "%-35s | %-20s | %-10s\n" "Thunderbolt USB (00:0d.0)" $(cat /sys/bus/pci/devices/0000:00:0d.0/power/control) $(cat /sys/bus/pci/devices/0000:00:0d.0/power/runtime_status)
printf "%-35s | %-20s | %-10s\n" "Thunderbolt NHI (00:0d.2)" $(cat /sys/bus/pci/devices/0000:00:0d.2/power/control) $(cat /sys/bus/pci/devices/0000:00:0d.2/power/runtime_status)

# --- REDE E ARMAZENAMENTO ---
printf "%-35s | %-20s | %-10s\n" "Wi-Fi Intel AX201 (00:14.3)" $(cat /sys/bus/pci/devices/0000:00:14.3/power/control) $(cat /sys/bus/pci/devices/0000:00:14.3/power/runtime_status)
printf "%-35s | %-20s | %-10s\n" "Ethernet Realtek (2e:00.0)" $(cat /sys/bus/pci/devices/0000:2e:00.0/power/control) $(cat /sys/bus/pci/devices/0000:2e:00.0/power/runtime_status)
printf "%-35s | %-20s | %-10s\n" "NVMe Samsung (2f:00.0)" $(cat /sys/bus/pci/devices/0000:2f:00.0/power/control) $(cat /sys/bus/pci/devices/0000:2f:00.0/power/runtime_status)

# --- ÁUDIO E INTERFACE ---
printf "%-35s | %-20s | %-10s\n" "Intel Smart Sound (00:1f.3)" $(cat /sys/bus/pci/devices/0000:00:1f.3/power/control) $(cat /sys/bus/pci/devices/0000:00:1f.3/power/runtime_status)
printf "%-35s | %-20s | %-10s\n" "Management Engine (00:16.0)" $(cat /sys/bus/pci/devices/0000:00:16.0/power/control) $(cat /sys/bus/pci/devices/0000:00:16.0/power/runtime_status)

# --- PERIFÉRICOS USB (DETECÇÃO DINÂMICA) ---
BT_DIR=$(grep -l 8087 /sys/bus/usb/devices/*/idVendor | head -n1 | xargs dirname 2>/dev/null)
[ -n "$BT_DIR" ] && printf "%-35s | %-20s | %-10s\n" "Bluetooth Intel (USB)" $(cat $BT_DIR/power/control) $(cat $BT_DIR/power/runtime_status)

M_DIR=$(grep -l 046d /sys/bus/usb/devices/*/idVendor | head -n1 | xargs dirname 2>/dev/null)
if [ -d "$M_DIR" ]; then
    printf "%-35s | %-20s | %-10s\n" "Mouse Logitech (USB)" $(cat $M_DIR/power/control) $(cat $M_DIR/power/runtime_status)
else
    printf "%-35s | %-20s | %-10s\n" "Mouse Logitech (USB)" "OFF" "N/A"
fi

# --- SISTEMA ---
printf "%-35s | %-20s | %-10s\n" "VM Writeback" "$(cat /proc/sys/vm/dirty_writeback_centisecs) cs" "N/A"
EPP_VAL=$(cat /sys/devices/system/cpu/cpufreq/policy0/energy_performance_preference)
printf "%-35s | %-20s | %-10s\n" "Intel EPP" "$EPP_VAL" "N/A"
ASPM_VAL=$(grep -o '\[.*\]' /sys/module/pcie_aspm/parameters/policy | tr -d '[]')
printf "%-35s | %-20s | %-10s\n" "PCIe ASPM Policy" "$ASPM_VAL" "N/A"

echo "----------------------------------------------------------------------"
