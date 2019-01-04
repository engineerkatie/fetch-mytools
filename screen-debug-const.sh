#!/bin/sh

cat ~/Coding/mytools/breakpoints.lldb > /tmp/breakpoints.lldb
echo "cont" >> /tmp/breakpoints.lldb

while true
do
    FOO="$IFS"
    IFS=$'\n'
    for i in `ps -ef  | grep constellation/constellation | grep -v grep | grep -v swarm | sed "s/  / /g" | sed "s/^ //g" | grep -n .`
    do
        N=`echo $i | cut -d':' -f1`
        P=`echo $i | cut -d' ' -f2`
        SCREEN=`screen -list | grep "$P" | wc -l`
        if [ $SCREEN -ne 1 ]
        then
            screen -S "lldb-$N-$P" -dm lldb -p "$P" -s /tmp/breakpoints.lldb
        fi
    done
    IFS="$FOO"
    clear
    screen -list
    egrep -i "ERROR|leave" build/NODES/node*/node.log
    ls -la build/NODES/node*/node.log
    sleep 1
done
