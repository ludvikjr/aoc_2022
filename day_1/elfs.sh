#!/bin/zsh

awk 'BEGIN { file="elfs/elf"++i } !NF {file="elfs/elf"++i; next} {print > file} ' data

MAX_FRUITS=0

for i in ./elfs/*; do
    LN_CNT=$(wc -l <"$i")
    CURR_FRUITS=0
    for ((j = 1; j <= LN_CNT; j++)); do
        CURR_LN=$(head -n "$j" "$i" | tail -n 1)
        ((CURR_FRUITS += $CURR_LN))
    done
    if ((CURR_FRUITS > MAX_FRUITS)); then
        MAX_FRUITS=$CURR_FRUITS
    fi
done

printf '1st: %d\n' $MAX_FRUITS
