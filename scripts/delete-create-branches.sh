#! /bin/bash

git push
BASEDIR=$(cd $(dirname "$0"); cd ..; pwd)
for t in $($BASEDIR/scripts/tags.sh); do
	echo Branch: $t
	git push origin --delete $t
	git push origin master:$t
done
