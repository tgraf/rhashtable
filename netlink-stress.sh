#!/bin/bash

echo "Starting Netlink stress test..."
echo "Press ^C to quit"
echo ""

sleep 1s

ulimit -n 10000
while true; do
	./bind_netlink 9000 234234234&
	./bind_netlink 9000 908345433&
	./bind_netlink 9000 456232522
done
