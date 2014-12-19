#!/bin/bash

CHECKPKG=`dpkg --get-selections | egrep '^(gpgv|lsb-release)' | awk '{print $2}' | grep -v "deinstall" | wc -l`
if [ ! $CHECKPKG == "2" ]; then
sudo apt-get -y install lsb-release gpgv
else
echo "All needed packages installed"
fi

BUILDPATH=`pwd`

CODENAME=`lsb_release -a 2>/dev/null |grep "Codename:" | awk '{print $2}'`

sed -i "s/changeme/$CODENAME/g" $BUILDPATH/debian/changelog
TIMEOUT=""
CRON="*/5 * * * * root /usr/bin/timeout -k1m -s9 6m /usr/bin/flant-integration -b &>/dev/null"
if [ "x$CODENAME" == "xlucid" ];then
	TIMEOUT="timeout\,\ "
	CRON="*/5 * * * * root /usr/bin/timeout -9 600 /usr/bin/flant-integration -b &>/dev/null"
fi
sed -i "s/TMOT/$TIMEOUT/g" $BUILDPATH/debian/control

dpkg-buildpackage -k860D255B $1
