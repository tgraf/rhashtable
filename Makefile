CC = gcc
CFLAGS = 

PROGS = jhash bind_netlink

all: $(PROGS)

netlink-stress: bind_netlink
	./netlink-stress.sh

jhash-percent: jhash
	./jhash-percent.sh

jhash-dist: jhash
	./jhash-dist.sh

help:
	@echo ""
	@echo "rhashtable tests"
	@echo ""
	@echo "make netlink-stress	Netlink stress test"
	@echo "make jhash-percent	Show percentage of colliding buckets"
	@echo "make jhash-dist		Show distribution of chain lengths (collisions)"
	@echo ""

clean:
	rm -f $(PROGS) *.o
