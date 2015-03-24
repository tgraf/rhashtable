#!/bin/bash

echo "Percentage of buckets with more than one entry:"
echo "Table size (2^N) | Percentage"
echo "-----------------------------------------------"

for i in $(seq 1 31); do
	SIZE=$((2**$i))
	NDUP=$(./jhash $SIZE | sort | uniq -D | uniq -c | wc -l)
	P=$(((100*$NDUP)/$SIZE))
	printf "%16d | %3s%%\n" $i "$P"
done
