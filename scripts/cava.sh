#!/bin/bash
FIFO="$HOME/.cache/cava.fifo"

# Create FIFO and start cava
rm -f "$FIFO"
mkfifo "$FIFO"
nohup cava -p ~/.config/cava/waybar.conf &>/dev/null &
sleep 0.5

bars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

while read -t 5 line <&3; do
    IFS=';' read -ra vals <<< "$line"
    out=""
    active=0
    for v in "${vals[@]}"; do
        v=$(echo "$v" | tr -d '[:space:]')
        [[ "$v" =~ ^[0-9]+$ ]] || v=0
        i=$((v / 143))
        ((i>7)) && i=7
        c="${bars[$i]}"
        [[ -z "$c" ]] && c="▁"
        if ((v>700)); then col="#bf616a"
        elif ((v>400)); then col="#a3be8c"
        elif ((v>100)); then col="#88c0d0"
        else col="#5e81ac"; fi
        out+="<span color='$col'>$c</span>"
        ((v>50)) && active=1
    done
    ((active)) && echo "{\"text\": \"$out\"}" || echo "{\"text\": \"<span color='#5e81ac'>▁▁▁▁▁▁▁▁▁▁</span>\"}"
done 3<> "$FIFO"
