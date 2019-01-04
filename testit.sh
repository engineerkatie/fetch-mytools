#!/bin/sh

set -x
set -e

git pullall && (mkdir -vp build; cd build; cmake ../;) && ../mytools//buildit.sh test

