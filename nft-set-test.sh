#!/bin/bash

NFT=./nft.sh
NFTABLES=$PWD/nft/nftables

$NFT -f $NFTABLES/files/nftables/ipv4-filter
$NFT list table filter

echo "define test_set = {" > test.set
for i in $(seq 1 254); do
	echo "  10.1.1.$i," >> test.set
done
echo "  10.2.1.1 }" >> test.set
echo 'add rule filter output ip daddr $test_set counter' >> test.set

$NFT -f test.set
$NFT delete rule filter output

rm -f test.set
