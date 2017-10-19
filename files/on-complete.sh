#!/bin/sh
rootPath=/aria2

if [ $2 -eq 1 ]; then
	mv "$3" $rootPath/data
fi
echo [$(date)] $2, $3, $1 "<br>" >> $rootPath/data/_log.html