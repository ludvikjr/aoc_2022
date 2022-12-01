#!/bin/zsh

awk 'BEGIN { file="elfs/elf"++i } !NF {file="elfs/elf"++i; next} {print > file} ' data

MAX_FRUITS=0
SND_FRUITS=0
THD_FRUITS=0

for i in ./elfs/*; do
    LN_CNT=$(wc -l <"$i")
    CURR_FRUITS=0
    for ((j = 1; j <= LN_CNT; j++)); do
        CURR_LN=$(head -n "$j" "$i" | tail -n 1)
        ((CURR_FRUITS += $CURR_LN))
    done
    if ((CURR_FRUITS > MAX_FRUITS)); then
        THD_FRUITS=$SND_FRUITS
        SND_FRUITS=$MAX_FRUITS
        MAX_FRUITS=$CURR_FRUITS
    elif ((CURR_FRUITS < MAX_FRUITS && CURR_FRUITS > SND_FRUITS)); then
        THD_FRUITS=$SND_FRUITS
        SND_FRUITS=$CURR_FRUITS
    elif ((CURR_FRUITS < SND_FRUITS && CURR_FRUITS > THD_FRUITS)); then
        THD_FRUITS=$CURR_FRUITS
    fi
done

printf '1st: %d\n' $MAX_FRUITS
printf '2nd: %d\n' $SND_FRUITS
printf '3rd: %d\n' $THD_FRUITS
printf '------------\n'
printf "total: %d\n" $((MAX_FRUITS + SND_FRUITS + THD_FRUITS))
