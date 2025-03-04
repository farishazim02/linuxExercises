#!/bin/bash

total=0
pattern="^[01]+$"

for num in {1000..2000}; do
    if [[ $num =~ $pattern ]]; then
	((total += $num)) # add the num of the digit 0 or 1
    fi

done

echo "Sum: $total"
