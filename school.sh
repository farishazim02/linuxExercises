#!/bin/bash

cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d ',' -f 7 |
    { total=0; length_count=0; while read n; do total=$(($total + $n)); length_count=$(($length_count + 1)); done; 
      average=$(echo "scale = 4; $total / $length_count" | bc); echo -e "sum = $total\naverage = $average"; }
