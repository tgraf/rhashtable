#!/bin/bash

DIR=$PWD/nft

rm -rf $DIR
mkdir -p $DIR/share
cd $DIR

cat << EOF > $DIR/share/config.site
CPPFLAGS=-I$DIR/include
LDFLAGS=-L$DIR/lib
EOF

export PKG_CONFIG_PATH=$DIR/lib/pkgconfig

git clone git://git.netfilter.org/libmnl
cd libmnl
./autogen.sh && ./configure --prefix=$DIR
make
make install

cd $DIR
git clone git://git.netfilter.org/libnftnl
cd libnftnl
./autogen.sh && ./configure --prefix=$DIR
make
make install

cd $DIR
git clone git://git.netfilter.org/nftables
cd nftables
./autogen.sh && ./configure --prefix=$DIR
make
make install
