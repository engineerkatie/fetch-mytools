#!/bin/sh

set -e
set -x

rm -rfv build/libs
rm -rfv build/apps

../mytools/buildit.sh
