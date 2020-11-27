#! /bin/bash

BASEDIR=$(cd $(dirname "$0"); cd ..; pwd)
for t in $($BASEDIR/scripts/tags.sh); do
	git tag -f $t
done


