#!/usr/bin/awk -f

{
if ($1 == "A")
    opponent=1
else if ($1 == "B")
    opponent=2
else
    opponent=3

if ($2 == "X")
    player=1
else if ($2 == "Y")
    player=2
else
    player=3

if (player == opponent)
    outcome=3
else if ((player == 1 && opponent == 3) || (player == 2 && opponent == 1) || (player == 3 && opponent == 2))
    outcome=6
else
    outcome=0

total += outcome + player
}

END { print total }


