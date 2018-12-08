# docker-pxe-boot-server

# To build the image for pxe server
docker build -t pxe .

# To run the docker container
docker run --network host -tid -v /sys/fs/cgroup:/sys/fs/cgroup -v $MOUNT_PATH_ISO:/var/www/centos -v $MOUNT_PATH_ISO/images/pxeboot/vmlinuz:/var/lib/tftpboot/centos/vmlinuz -v $MOUNT_PATH_ISO/images/pxeboot/initrd.img:/var/lib/tftpboot/centos/initrd.img -v /root/pxe/ks-auto.cfg:/var/www/centos/ks-auto.cfg --cap-add SYS_ADMIN pxe

# Config
default - tftpboot config file
dhcpd.conf - dhcpd config file
ks-auto.cfg - kickstart config file
pxe.conf - httpd config file
tftp - xinetd config file

## IMPORTANT
### CONFIG FILES NEED TO BE CHANGE TO FIT THE NETWORK ENVIRONMENT
### $MOUNT_PATH_ISO is the path where the centos iso is mounted 
`$ mount -o loop CentOS-7-x86_64-DVD-1804.iso /mnt`

## Example
`$ mount -o loop CentOS-7-x86_64-DVD-1804.iso /mnt`
`docker run --network host -tid -v /sys/fs/cgroup:/sys/fs/cgroup -v /mnt:/var/www/centos -v /mnt/images/pxeboot/vmlinuz:/var/lib/tftpboot/centos/vmlinuz -v /mnt/images/pxeboot/initrd.img:/var/lib/tftpboot/centos/initrd.img -v /root/pxe/ks-auto.cfg:/var/www/centos/ks-auto.cfg --cap-add SYS_ADMIN pxe`