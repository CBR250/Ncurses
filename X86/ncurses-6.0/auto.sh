#!/bin/bash
CURDIR=$PWD
PACKAGE=$CURDIR/PACKAGE
TARGET=$CURDIR/TARGET
OBJ=$CURDIR/OBJ

if [ ! -d "$PACKAGE" ]; then
	mkdir $PACKAGE
fi

if [ ! -d "$TARGET" ]; then
	mkdir $TARGET
fi

if [ ! -d "$OBJ" ]; then
	mkdir $OBJ
fi

echo "************ ncurses-6.0  ***********************"
if [ ! -d $TARGET/ncurses-6.0 ]; then
    cd $PACKAGE
    tar xvf "ncurses-6.0.tar.gz" -C $TARGET

    cd $TARGET/ncurses-6.0/

    ./configure \
       --prefix=$OBJ/ \
       --with-shared \

    make
    make install
fi
