#!/bin/bash -eu

set -o pipefail

CURRENT_BRANCH=$(git branch -vv | grep '^*' | awk '{ print $2 }')

if ! (git branch -vv | grep "\[origin/$CURRENT_BRANCH\]") > /dev/null; then
    git push -u origin $CURRENT_BRANCH
else
    echo origin/$CURRENT_BRANCH already exists!
    exit 1
fi
