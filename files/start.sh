#!/bin/sh
rootPath=/aria2

if [ ! -f $rootPath/conf/aria2.conf ]; then
	cp $rootPath/conf-copy/aria2.conf $rootPath/conf/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> $rootPath/conf/aria2.conf
	fi
fi
if [ ! -f $rootPath/conf/on-complete.sh ]; then
	cp $rootPath/conf-copy/on-complete.sh $rootPath/conf/on-complete.sh
fi

chmod +x $rootPath/conf/on-complete.sh
touch $rootPath/conf/aria2.session

darkhttpd $rootPath/aria2-webui --port 80 &
darkhttpd $rootPath/data --port 8080 &

aria2c --conf-path=$rootPath/conf/aria2.conf