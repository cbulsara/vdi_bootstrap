#!/bin/bash

#check root
#if [ 'whoami' != 'root' ]; then
#echo "Need to run as root, or with sudo"; exit
#fi

#update
apt-get update && apt-get upgrade -y

#dependencies
apt-get install -y libpcap-devel openssl-devel python-devel cmake gcc-c++ gcc swig bison flex zlib-devel perl pcre libdnet libdnet-devel glib2-devel perl-CPAN subversion git p7zip

#dockersudo 
apt-get install -y docker

#ufw
apt-get install -y ufw

#nettoolssu
apt-get install -y net-tools

#gperftools
apt-get install -y gperftools

#tcpdump
apt-get install -y tcpdump

#curl
apt-get install -y curl

#recordmydesktop
apt-get install -y shutter

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
apt-get install snort

##pulledpork
cd /sbin
git clone git://github.com/shirkdog/pulledpork
cd /

## Bro
apt-get install -y bro

#SiLK
#cd /tmp
#wget https://forensics.cert.org/cert-forensics-tools-release-el7.rpm
#rpm -Uvh cert-forensics-tools-release*rpm
#sudo yum --enablerepo=forensics install silk-analysis
#sudo yum --enablerepo=forensics install silk-flowcap
#cd /

#pip
cd /tmp
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py

#didier stevens
cd /opt
wget http://didierstevens.com/files/software/DidierStevensSuite.zip
unzip DidierStevensSuite.zip
sudo chmod -R ugo+rwx DidierStevensSuite
cd /
pip install olefile

#wireshark
apt-get install -y wireshark

#scapy and dependencies
pip install scapy
pip install matplotlib
pip install Pyx 
pip install Crypto
pip install ecdsa
pip install pandas

#yaf
#yum install -y yaf