#!/bin/bash

#check root
#if [ 'whoami' != 'root' ]; then
#echo "Need to run as root, or with sudo"; exit
#fi

#update
yum -y update

#dependencies
yum -y install epel-release libpcap-devel openssl-devel python-devel cmake gcc-c++ gcc swig bison flex zlib-devel perl pcre libdnet libdnet-devel glib2-devel perl-CPAN subversion git p7zip

#dockersudo 
yum -y install docker

#ufw
yum -y install ufw

#nettoolssu
yum -y install net-tools

#gperftools
yum -y install gperftools

#tcpdump
yum -y install tcpdump

#curl
yum -y install curl

#recordmydesktop
yum -y install recordmydesktop
yum -y install gtk-recordmydesktop

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
yum -y install https://www.snort.org/downloads/snort/daq-2.0.6-1.centos7.x86_64.rpm
                      
yum -y install https://www.snort.org/downloads/snort/snort-2.9.9.0-1.centos7.x86_64.rpm

chmod -R 5775 /etc/snort
chmod -R 5775 /var/log/snort
#chmod ugo=rw /var/log/snort/alert          try solving by changing owner to snort and adding users to group

touch /etc/snort/rules/white_list.rules
touch /etc/snort/rules/black_list.rules
#conf edits
sed -i 's|\(^dynamicpreprocessor directory \).*|\1/usr/lib64/snort-2.9.9.0_dynamicpreprocessor/|' /etc/snort/snort.conf
sed -i 's|\(^dynamicengine \).*|\1/usr/lib64/snort-2.9.9.0_dynamicengine/libsf_engine.so|' /etc/snort/snort.conf
sed -i 's|\(^dynamicdetection directory \).*|\1/usr/lib64/snort-2.9.9.0_dynamicrules|' /etc/snort/snort.conf


##pulledpork
cd /sbin
git clone git://github.com/shirkdog/pulledpork
cd /

## Bro
yum -y install bro

#SiLK
cd /tmp
wget https://forensics.cert.org/cert-forensics-tools-release-el7.rpm
rpm -Uvh cert-forensics-tools-release*rpm
sudo yum --enablerepo=forensics install silk-analysis
sudo yum --enablerepo=forensics install silk-flowcap
cd /

#pip
cd /tmp
wget https://boostrap.pypa.io/get-pip.pyp
python get-pip.py

#didier stevens
cd /opt
wget http://didierstevens.com/files/software/DidierStevensSuite.zip
unzip DidierStevensSuite.zip
sudo chmod -R ugo+rwx DidierStevensSuite
cd /
pip install olefile


#xfce
yum groupinstall "Server with GUI" -y
yum groupinstall "Xfce" -y
systemctl set-default graphical.target

#wireshark
yum install -y wireshark
yum install -y wireshark

#scapy and dependencies
pip install scapy
pip install matplotlib
pip install Pyx 
pip install Crypto
pip install ecdsa

#yaf
yum install -y yaf