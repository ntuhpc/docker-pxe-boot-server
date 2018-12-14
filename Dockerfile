FROM centos:7

# This bit is exactly as per the documentation and can be stuck
# existing Dockerfiles without issue
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
  systemd-tmpfiles-setup.service ] || rm -f $i; done); \
  rm -f /lib/systemd/system/multi-user.target.wants/*;\
  rm -f /etc/systemd/system/*.wants/*;\
  rm -f /lib/systemd/system/local-fs.target.wants/*; \
  rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
  rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
  rm -f /lib/systemd/system/basic.target.wants/*;\
  rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
VOLUME [ "/var/www/centos"]

# In case it isn't obvious, you do NOT need httpd, it is only
# an example implementation so can be safely ignored.
RUN yum -y install httpd xinetd syslinux tftp-server dhcp*; yum clean all;
RUN cp -a /usr/share/syslinux/* /var/lib/tftpboot/
RUN mkdir -p /var/lib/tftpboot/centos ; mkdir -p /var/lib/tftpboot/pxelinux.cfg/
# COPY pxe.conf /etc/httpd/conf.d/pxe.conf
# COPY default /var/lib/tftpboot/pxelinux.cfg/default
# COPY tftp /etc/xinetd.d/tftp
# COPY dhcpd.conf /etc/dhcp/dhcpd.conf

# You HAVE to enable your service PRIOR to calling "init"
# since the init call is what ultimately fires it up
RUN systemctl enable httpd xinetd tftp dhcpd

# Again, no need to expose port 80, it is used as part of the
# example implementation
# 80 httpd tcp
# 1776 dhcpd udp
# 970 xinetd udp
# 69 tftp udp
#EXPOSE 80 
#EXPOSE 1776/udp
#EXPOSE 970/udp
#EXPOSE 69/udp

# This here does the magic and starts your service
CMD ["/usr/sbin/init"]

