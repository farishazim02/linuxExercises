#!/bin/bash

# this sh removes all files in a directory larget than n bytes

if [[ $# -ne 2 ]]; then
    echo "usage: $0 <dir> <n>" 1>&2
    exit 0
fi

directory=$1
bytes=$2

find $directory -type f -size +${bytes}c -exec rm {} \;

# for exec, you need ';' to end it. Since ';' is a speical character in shell, you can use \ to escape ';' or you can use ';' directly.
