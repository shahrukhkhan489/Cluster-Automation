# Hostname of the node to be included in Hadoop Cluster
HOSTNAME=yourhostname



# modifying hostname in configuration file so that change remains permanent
sed -i "s/HOSTNAME=/(.*/)/HOSTNAME=$HOSTNAME/g" /etc/sysconfig/network

# modifying hostname of the system at runtime
hostname $HOSTNAME

# putting hostname entry to hosts file for FDQN Resolution
echo $(hostname -I) $HOSTNAME >> /etc/hosts

# Stopping IpTables
service iptables stop

# Preventing IPTables from Starting up at System Startup
chkconfig iptables off

# Disbaling SELINUX
sed -i "s/=/(.*/)/=disabled/g" /etc/selinux/config

# Rebooting computer for SELINUX to Disable
reboot
