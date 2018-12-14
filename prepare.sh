#!/bin/bash
set -u 
if [ "$#" -ne 4 ]; then
    echo 'Usage: prepare.sh 10.0.0.238 10.0.0.0 10.0.0.10 10.0.0.20'
    exit 1
fi

cp ./conf/* .

10.0.0.238=$1
10.0.0.0=$2
10.0.0.10=$3
10.0.0.20=$4

find ./ -type f -exec sed -i -e "s/10.0.0.238/$10.0.0.238/g" {} \;
find ./ -type f -exec sed -i -e "s/10.0.0.0/$10.0.0.0/g" {} \;
find ./ -type f -exec sed -i -e "s/10.0.0.10/$10.0.0.10/g" {} \;
find ./ -type f -exec sed -i -e "s/10.0.0.20/$10.0.0.20/g" {} \;
# sed -e "s/10.0.0.238/$1/g" ./conf/default > ./default
# sed -e "s/10.0.0.238/$1/g" ./conf/ks-auto.cfg > ./ks-auto.cfg

