#!/bin/sh
BRANCH=`git branch | egrep "^\* " | cut -c3-10000`
git diff --name-only $BRANCH $(git merge-base  $BRANCH develop)
