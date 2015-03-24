#!/bin/bash

echo "Distribution of chain lengths (number of collisions)" 
echo "---------------------------------------------------------------"

for i in $(seq 1 31); do
	SIZE=$((2**$i))
	echo "$i ($SIZE):"
	./jhash $SIZE | sort | uniq -D | uniq -c | sort -n \
		| awk '{print $1;}' | uniq -c | sort -n -r \
		| awk -v size=${SIZE} '{printf "%6d x %2d (%f%%)\n", $1, $2, 100.0*$1/size}'
done
