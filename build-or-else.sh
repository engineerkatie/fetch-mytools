#!/bin/sh

set -o pipefail
(../mytools/buildit.sh $* 2>&1 | tee /tmp/wabble) || ( cat /tmp/wabble | fgrep -v "] Building"; false )
