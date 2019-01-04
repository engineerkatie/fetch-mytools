#!/bin/sh

set -e
set -x

mkdir -vp build
mkdir -vp build/NODES/
(cd build/;cmake ../)
killall constellation || true
sleep 1
killall lldb || true
sleep 1
killall screen || true
clear
(cd build/;make -j100 $*)
( rm -v data-*/* || true)
mkdir -vp build/swarmlog/
for i in `ls build/swarmlog/* 2>/dev/null`
do
    echo "" > $i
done
