#!/bin/bash

usage() {
    echo "usage: ./mean.sh <column> [file.csv]" >&2
}

if [ -z "$1" ]; then
    usage
    exit 1
fi

column=$1
file=${2:-/dev/stdin}

tail -n +2 "$file" | cut -d ',' -f "$column" |
    { sum=0; count=0;
      while read value; do
            sum=$(echo "$sum + $value" | bc -l);
            count=$((count + 1));
	    done;
      mean=$(echo "$sum / $count" | bc -l);
      echo "Mean of column $column: $mean"; }
