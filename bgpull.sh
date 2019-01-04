#!/bin/sh

remotename="origin"
branch=$1
if [ "$2" != "" ]
then
    remotename=$2
fi

git fetch $remotename $branch:$branch
