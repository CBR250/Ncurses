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

echo "************ ncurses-5.9.tar.gz  ***********************"
if [ ! -d $TARGET/ncurses-5.9 ]; then
    cd $PACKAGE
    tar xvf "ncurses-5.9.tar.gz" -C $TARGET

    cd $TARGET/ncurses-5.9/
    patch -Np1 -d $TARGET/ncurses-5.9/ < $CURDIR/PATCH/MKlib_gen.patch
    
    CPPFLAGS="-P" \
    ./configure \
       --prefix=$OBJ/ \
       --with-shared \
       --without-cxx-binding \

    make
    make install
fi
