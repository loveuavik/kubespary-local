#!/bin/bash
set -e

BINDIR="/opt/bin"

mkdir -p $BINDIR

cd $BINDIR

if [[ -e $BINDIR/.bootstrapped ]]; then
  exit 0
fi

PYPY_VERSION=7.0.0

wget -O - http://10.150.17.148:443/pypy3.5-$PYPY_VERSION-linux_x86_64-portable.tar.bz2 | tar -xjf -
mv -n pypy3.5-$PYPY_VERSION-linux_x86_64-portable pypy3

ln -s ./pypy3/bin/pypy3 python
$BINDIR/python --version

touch $BINDIR/.bootstrapped
