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
apt-get install -y recordmydesktop
apt-get install -y gtk-recordmydesktop

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
apt-get install -y snort
                      
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
apt-get install -y bro

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