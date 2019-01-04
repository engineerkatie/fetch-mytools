#!/bin/sh

set -x
set -e

killall constellation || true
sleep 1
killall lldb || true
sleep 1
killall screen || true
sleep 1
screen -ls | grep pts | cut -d. -f1 | awk '{print $1}' | xargs kill

killall constellation || true
sleep 1
killall lldb || true
sleep 1
killall screen || true
sleep 1
screen -ls | grep pts | cut -d. -f1 | awk '{print $1}' | xargs kill
