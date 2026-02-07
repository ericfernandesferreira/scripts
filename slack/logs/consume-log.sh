#!/bin/bash

while true; do
  DATA=$(date '+%Y-%m-%d %H:%M:%S')
  
  # 1. Consumo em Watts
  WATTS=$(echo "scale=2; $(cat /sys/class/power_supply/BAT0/power_now) / 1000000" | bc)
  
  # 2. Status da GPU
  GPU_STATUS=$(cat /sys/bus/pci/devices/0000:01:00.0/power_state)
  
  # 3. CPU Frequência Média
  FREQ=$(cat /proc/cpuinfo | grep "cpu MHz" | awk '{sum+=$4} END {printf "%.0f", sum/NR}')
  
  # 4. CPU Governor (Lê do primeiro núcleo como referência)
  GOV=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
  
  # 5. Cálculo de Load (Baseado no loadavg)
  CPU_LOAD=$(cat /proc/loadavg | awk '{printf "%.1f", $1 * 10}')
  
  # 6. Temperatura via lm_sensors (Package id 0)
  TEMP=$(sensors | grep "Package id 0" | awk '{print $4}' | tr -d '+°C')

  # Output organizado
  echo "$DATA | Consumo: $WATTS W | GPU: $GPU_STATUS | Gov: $GOV | CPU: ${FREQ}MHz | Load: ${CPU_LOAD}% | Temp: ${TEMP}°C" >> consumo_energia.txt
  
  sleep 15
done
