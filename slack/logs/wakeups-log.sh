#!/bin/bash
# Monitor Unificado v30 - Layout Espelhado (SW & HW com :)

LOG="wakeups.txt"
cat /proc/interrupts > /tmp/intr_prev
SW_PREV=$(grep "ctxt" /proc/stat | awk '{print $2}')

get_friendly_name() {
    local raw_info=""
    case "$1" in
        i915*) raw_info="Intel Iris Graphics" ;;
        nvme*) raw_info=$(lspci | grep -i "Non-Volatile" | head -n 1 | cut -d: -f3 | sed 's/^ //') ;;
        xhci*) raw_info="USB Controller (XHCI)" ;;
        iwlwifi*) raw_info="Intel Wi-Fi 6" ;;
        i2c_designware.1*) raw_info="Touchpad Controller" ;;
        ELAN1205*) raw_info="Touchpad (ELAN)" ;;
        snd_hda*) raw_info="Intel Audio" ;;
        i8042*) raw_info="Keyboard/PS2 Mouse" ;;
        *) raw_info="Generic Device" ;;
    esac
    echo "${raw_info:0:25}"
}

while true; do
    DATA=$(date '+%H:%M:%S')
    cat /proc/interrupts > /tmp/intr_curr
    SW_CURR=$(grep "ctxt" /proc/stat | awk '{print $2}')
    
    HW_LIST=$(paste /tmp/intr_prev /tmp/intr_curr | awk '
        NR > 1 && $1 ~ /[0-9]:/ { 
            s_p=0; s_c=0; for(i=2; i<=9; i++) { s_p+=$i; s_c+=$(i+NF/2); }
            diff = s_c - s_p;
            if (diff > 0) { print "HW_" $NF, diff }
        }')
    
    SW_DELTA=$((SW_CURR - SW_PREV))
    SW_LIST=$(ps -axeo comm,pcpu --sort=-pcpu --no-headers | awk -v d="$SW_DELTA" '{
        val = (d * ($2/100));
        if($2 > 0 && val > 0.5) printf "SW_%s %.0f\n", $1, val
    }')

    COMBINED=$(echo -e "$HW_LIST\n$SW_LIST")
    TOTAL_GERAL=$(echo "$COMBINED" | awk '{sum+=$2} END {print sum}')
    
    echo -e "\n--- RANKING ATIVO: $DATA | Total Eventos: $TOTAL_GERAL ---" | tee -a $LOG
    
    if [ "$TOTAL_GERAL" -gt 0 ]; then
        echo "$COMBINED" | sort -rn -k2 | while read -r line; do
            val=$(echo $line | awk '{print $2}')
            perc=$(awk "BEGIN {printf \"%.1f\", ($val/$TOTAL_GERAL)*100}")
            raw_name=$(echo $line | awk '{print $1}')
            
            type=$(echo $raw_name | cut -d_ -f1)
            name=$(echo $raw_name | cut -d_ -f2-)

            if [ "$type" == "HW" ]; then
                friendly=$(get_friendly_name "$name")
                # Layout: [Perc] TYPE : ID (20) : Friendly (25) | Total
                printf "  [%-5s%%] %s : %-20s : %-25s | (%d Eventos)\n" "$perc" "$type" "${name:0:20}" "$friendly" "$val" | tee -a $LOG
            else
                # Agora o Software usa EXATAMENTE o mesmo template do hardware
                printf "  [%-5s%%] %s : %-20s : %-25s | (%d Eventos)\n" "$perc" "$type" "${name:0:20}" "" "$val" | tee -a $LOG
            fi
        done
    fi

    SW_PREV=$SW_CURR
    cat /tmp/intr_curr > /tmp/intr_prev
    sleep 15
done
