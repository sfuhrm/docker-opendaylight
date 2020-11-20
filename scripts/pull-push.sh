#! /bin/bash

BRANCHES=$(git branch --format "%(upstream)" | sed -ne"s#^refs/remotes/origin/\([0-9.]*\)\$#\1#p")
for i in ${BRANCHES}; do
    echo "#########"
    echo "Branch $i"
    git checkout "$i"
    git pull
    git push
done
git checkout master
