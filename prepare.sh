set -u 
if [ "$#" -ne 4 ]; then
    echo 'Usage: prepare.sh IPADDR SUBNET STARTRANGE ENDRANGE'
    exit 1
fi

cp ./conf/* .

IPADDR=$1
SUBNET=$2
STARTRANGE=$3
ENDRANGE=$4

find . -maxdepth 1 ! -name 'prepare.sh' -maxdepth 1 -type f -exec sed -i  "s/IPADDR/$IPADDR/g" {} \;
find . -maxdepth 1 ! -name 'prepare.sh' -maxdepth 1 -type f -exec sed -i  "s/SUBNET/$SUBNET/g" {} \;
find . -maxdepth 1 ! -name 'prepare.sh' -maxdepth 1 -type f -exec sed -i  "s/STARTRANGE/$STARTRANGE/g" {} \;
find . -maxdepth 1 ! -name 'prepare.sh' -maxdepth 1 -type f -exec sed -i  "s/ENDRANGE/$ENDRANGE/g" {} \;
