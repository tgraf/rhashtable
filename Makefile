CC = gcc
CFLAGS = 

PROGS = jhash bind_netlink

all: $(PROGS)

netlink-stress: bind_netlink
	./netlink-stress.sh

nft-test:
	./nft-set-test.sh

jhash-percent: jhash
	./jhash-percent.sh

jhash-dist: jhash
	./jhash-dist.sh

help:
	@echo ""
	@echo "rhashtable tests"
	@echo ""
	@echo "make netlink-stress	Netlink stress test (*)"
	@echo "make nft-test		NFTables set test (*)"
	@echo ""
	@echo "make jhash-percent	Show percentage of colliding buckets"
	@echo "make jhash-dist		Show distribution of chain lengths (collisions)"
	@echo ""
	@echo "(*): Requires root privileges"

clean:
	rm -f $(PROGS) *.o
