# docker-pxe-boot-server

# To build the image for pxe server
`docker build -t pxe .`

# To run the docker container
`docker-compose up -d`

# Config
default - tftpboot config file

dhcpd.conf - dhcpd config file

ks-auto.cfg - kickstart config file

pxe.conf - httpd config file

tftp - xinetd config file

## IMPORTANT
### CONFIG FILES NEED TO BE CHANGE TO FIT THE NETWORK ENVIRONMENT
### $MOUNT_PATH_ISO is the path where the centos iso extract to
`$ mount -o loop CentOS-7-x86_64-DVD-1804.iso /mnt`

`$ mkdir -p /centos/`

`$ cp -rv /mnt/* /centos`

## Example
`prepare.sh 10.0.0.2380.0.0.2380.0.0.2380.0.0.2380.0.0.238 10.0.0.2380.0.0.2380.0.0.2380.0.0.2380.0.0.0 10.0.0.2380.0.0.2380.0.0.2380.0.0.2380.0.0.10 10.0.0.2380.0.0.2380.0.0.2380.0.0.2380.0.0.20`

`docker-compose up -d`
