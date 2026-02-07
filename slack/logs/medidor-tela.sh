#!/bin/bash

# Define a pasta onde o script está
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_DATA="$DIR/sot_acumulado.log"
LOG_VISUAL="$DIR/sot_visual.log"

# Inicializa o log de dados se não existir
if [ ! -f "$LOG_DATA" ]; then echo 0 > "$LOG_DATA"; fi

# Timestamp inicial
ULTIMA_VERIFICACAO=$(date +%s)

while true; do
    # 1. Verifica o estado do monitor (DPMS)
    SCREEN_STATUS=$(xset q | grep "Monitor is" | awk '{print $3}')
    
    # 2. Pega o tempo do Xorg
    XORG_TIME=$(ps -eo comm,etime | grep Xorg | awk '{print $2}' | tr -d ' ')
    
    # 3. Timestamp atual e cálculo de diferença
    AGORA=$(date +%s)
    
    if [ "$SCREEN_STATUS" == "On" ]; then
        DIFERENCA=$((AGORA - ULTIMA_VERIFICACAO))
        ACUMULADO=$(cat "$LOG_DATA")
        NOVO_TOTAL=$((ACUMULADO + DIFERENCA))
        echo $NOVO_TOTAL > "$LOG_DATA"
    else
        NOVO_TOTAL=$(cat "$LOG_DATA")
    fi
    
    ULTIMA_VERIFICACAO=$AGORA

    # 4. Formata o Tempo de Tela (SOT)
    H=$((NOVO_TOTAL / 3600))
    M=$(( (NOVO_TOTAL % 3600) / 60 ))
    S=$((NOVO_TOTAL % 60))

    # 5. Grava no Log Visual (sobrescrevendo para não crescer infinitamente)
    # Se preferir que ele mantenha o histórico de cada segundo (como no seu exemplo), 
    # mude o ">" para ">>" na linha abaixo.
    {
        echo "------------------------------------------"
        printf "Tempo de Tela: %02dh %02dm %02ds\n" $H $M $S
        printf "Tempo do Xorg: %s\n" "$XORG_TIME"
    } > "$LOG_VISUAL"

    sleep 1
done
