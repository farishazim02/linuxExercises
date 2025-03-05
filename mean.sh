#!/bin/bash

if [[ ($# -lt 1) || ($# -gt 2) ]]; then
    echo "usage: $0 <column> [file.csv]" 1>&2
    exit 0
fi

column=$1

if [[ $# -eq 2 ]]; then
    file=$2
else
    file=/dev/stdin
fi

tail -n +2 $file | cut -d ',' -f $column | 
    { total=0; count=0; while read n; do total=$(echo "scale = 4; $total + $n" | bc -l); count=$(($count + 1)); done;
      mean=$(echo "scale = 4; $total / $count" | bc -l); echo "Mean of column $column = $mean"; }
