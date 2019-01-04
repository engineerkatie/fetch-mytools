#!/bin/sh
BRANCH=`git branch | egrep "^\* " | cut -c3-10000`
git difftool -d $BRANCH..develop
