#!/bin/bash
OTRS_VERSION="otrs-5.0.18"
echo "start with the basics"
apt-get update
apt-get install apache2 libapache2-mod-perl2 bash-completion libdatetime-perl libcrypt-ssleay-perl phantomjs libtemplate-perl  libarchive-zip-perl libxml-libxml-perl libxml-libxslt-perl
apt-get install libcrypt-eksblowfish-perl libdbi-perl libdbd-mysql-perl libencode-hanextra-perl libio-socket-ssl-perl libjson-xs-perl libscalar-list-utils-perl libwww-perl
apt-get install libmail-imapclient-perl libnet-dns-perl libnet-ldap-perl libtemplate-perl libtext-csv-xs-perl perl libxml-parser-perl libyaml-libyaml-perl
cd /opt
wget http://ftp.otrs.org/pub/otrs/$OTRS_VERSION.tar.gz
tar xvzf $OTRS_VERSION.tar.gz
ln -s $OTRS_VERSION otrs
useradd -d /opt/otrs -c 'OTRS user' -s /bin/bash otrs 
usermod -G www-data otrs
cd /opt/otrs/
cp Kernel/Config.pm.dist Kernel/Config.pm
a2enmod perl
a2enmod version
a2enmod deflate
a2enmod filter
a2enmod headers
a2dismod mpm_event
a2enmod mpm_prefork
bin/otrs.SetPermissions.pl --web-group=otrs
cd /opt/otrs/var/cron
for foo in *.dist; do cp $foo `basename $foo .dist`; done
mkdir /opt/otrs_data
chown otrs:www-data /opt/otrs_data/
chmod 775 /opt/otrs_data/
cd /etc/apache2/conf-enabled/
ln -s /opt/otrs/scripts/apache2-httpd.include.conf otrs.conf
/etc/init.d/apache2 restart
echo "Basics done"

