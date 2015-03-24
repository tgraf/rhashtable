#!/bin/bash

DIR=$PWD/nft
NFT=$DIR/sbin/nft
export LD_LIBRARY_PATH=$DIR/lib
exec $NFT $*
