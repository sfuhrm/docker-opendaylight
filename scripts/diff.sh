#! /bin/bash

git checkout master
BRANCHES=$(git branch --format "%(upstream)" | sed -ne"s#^refs/remotes/origin/\([0-9.]*\)\$#\1#p")
for i in ${BRANCHES}; do
    echo "#########"
    echo "Branch $i"
    git diff "$i"
done
