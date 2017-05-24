#!/bin/bash

#check root
#if [ 'whoami' != 'root' ]; then
#echo "Need to run as root, or with sudo"; exit
#fi

#update
yum update

#dependencies
yum install epel-release libpcap-devel openssl-dev python-devel cmake gcc-c++ gcc swig bison flex zlib-devel perl pcre libdnet libdnet-devel glib2-devel perl-CPAN subversion git

#nettools
yum install net-tools

#gperftools
yum install gperftools

#tcpdump
yum install tcpdump

#curl
yum install curl

#GeoLite
cd /tmp
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
gunzip GeoLiteCity.dat.gz
mv GeoLiteCity.dat /usr/share/GeoIP/GeoIPCity.dat
cd /

#pulledpork perl dependencies
#sudo perl -MCPAN -e 'install Bundle::LWP'
#<enter>
#<enter>
#<enter>
#<enter>
#sudo cpan YAML
#sudo perl -MCPAN -e 'install Path::Class'
#sudo perl -MCPAN -e 'force install Crypt::SSLeay'
#sudo perl -MCPAN -e 'install Sys::Syslog'
#sudo cpan -i Archive::Tar

#snort
yum install https://www.snort.org/downloads/snort/daq-2.0.6-1.centos7.x86_64.rpm
                      
yum install https://www.snort.org/downloads/snort/snort-2.9.9.0-1.centos7.x86_64.rpm

chmod -R 5775 /etc/snort
chmod -R 5775 /var/log/snort
#chmod ugo=rw /var/log/snort/alert          try solving by changing owner to snort and adding users to group

touch /etc/snort/rules/white_list.rules
touch /etc/snort/rules/black_list.rules

##pulledpork
cd /sbin
sudo git clone git://github.com/shirkdog/pulledpork
cd /

## Bro
yum install bro

#SiLK
cd /tmp
wget https://forensics.cert.org/cert-forensics-tools-release-el7.rpm
rpm -Uvh cert-forensics-tools-release*rpm
sudo yum --enablerepo=forensics install silk-analysis
sudo yum --enablerepo=forensics install silk-flowcap
cd /