#! /bin/bash
git branch --format "%(upstream)" | sed -ne"s#^refs/remotes/origin/\([0-9.]*\)\$#\1#p"
