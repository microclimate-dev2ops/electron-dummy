#!/bin/bash

if [ "$1" = "" ]
then
    echo Usage: create-version version
    exit 1
fi

version=$1
mkdir $version
cd $version
echo "dummy file" > electron
echo -ne $version > version
zip electron.zip electron version
cp electron.zip electron-$version-linux-x64.zip
cp electron.zip electron-$version-linux-ppc64.zip
cp electron.zip electron-$version-linux-s390x.zip
rm electron.zip electron version
shasum -b -a 256 electron-$version-linux-*.zip > SHASUMS256.txt
