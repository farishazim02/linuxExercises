#!/bin/bash
total=0

for num in {1000..2000}; do

    if [[ $num =~ ^[01]+$ ]]; then
	((total += $num)) #add the num of the digit 0 or 1
    fi

done

echo "Sum: $total"
