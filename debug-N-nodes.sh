#!/bin/sh

set -e
set -x

killall constellation || true
sleep 1
killall lldb || true
sleep 1
killall screen || true

debugfirst=$1
members=$1
if [ "$2" != "" ]
then
    members=$2
fi

./apps/demoswarm/runswarm.py --binary "../../../build/apps/constellation/constellation build/NODES/" --nodetype ConstellationNode --members $members --debugger lldb --debugfirst $debugfirst
