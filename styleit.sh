#!/bin/sh

set -x
set -e

git pullall && (mkdir -vp build; cd build; cmake ../;) && ./scripts/apply-style.py

