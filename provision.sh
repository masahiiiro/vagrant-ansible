#!/usr/bin/env bash

echo "Installing Apache and settings it up..."
#usr/bin/yum -y update > /dev/null 2>&1
#echo "Finish : /usr/bin/yum -y update > /dev/null 2>&1"
/usr/bin/yum install -y httpd httpd-devel > /dev/null 2>&1
echo "Finish : /usr/bin/yum install -y httpd httpd-devel > /dev/null 2>&1"
rm -rf /var/www/html
echo "Finish : rm -rf /var/www/html"
ln -fs /vagrant /var/www/html
echo "Finish : ln -fs /vagrant /var/www/html"
/etc/init.d/httpd start
echo "Finish : Starting Apche server"
/usr/bin/yum install -y iptables
echo "Finish : /usr/bin/yum install -y iptables"
#iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
#echo "Finish : -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT"
#iptables-save > 
#echo "Finish : iptables-save"
#/etc/init.d/iptables start
#echo "Finish : /etc/init.d/iptables start"
#/etc/init.d/network restart
#echo "Finish : /etc/init.d/network restart"
chmod 0777 /etc/sysconfig/iptables
cp /vagrant/templates/iptables /etc/sysconfig/iptables
chmod 0600 /etc/sysconfig/iptables
/etc/init.d/iptables restart
/etc/init.d/network restart
echo "Finish : /etc/init.d/network restart"
