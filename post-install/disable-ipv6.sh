sudo touch /etc/sysctl.d/40-ipv6.conf
echo "net.ipv6.conf.all.disable_ipv6 = 1" > /etc/sysctl.d/40-ipv6.conf

