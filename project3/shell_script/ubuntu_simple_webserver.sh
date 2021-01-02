#!/bin/bash -x

# needed for cloud init, otherwise network doesn't work good
sleep 30 


APACHEUSER="www-data"


echo "INSTALL APACHE"
DEBIAN_FRONTEND=noninteractive apt-get -yq update
DEBIAN_FRONTEND=noninteractive apt-get -yq install apache2 libapache2-mod-wsgi python-dev nfs-common

echo "PREPARE VHOST DIRS"
#mkdir -p /var/www/html/project2.lan/public_html 
#chown -R $APACHEUSER:$APACHEUSER /var/www/html/project2.lan/public_html
#chmod -R 755 /var/www/html/

mkdir -p /var/www/html
chown -R $APACHEUSER:$APACHEUSER /var/www/html
chmod -R 755 /var/www/html/

echo "192.168.200.4:/data        /var/www/html   nfs     defaults        0 0" >> /etc/fstab

#echo "CONFIGURE VHOSTS"
#cat <<'EOF' > /var/www/html/project2.lan/public_html/index.html
#<html>
# <head>
# <title>vhost1 test</title>
# </head>
# <body>
# <h1>Hello, This is a test page for project2.lan website based on ubuntu and apache</h1>
# <h1>test for 2nd run</h1>
# </body>
#</html>
#EOF

#cat <<'EOF' >> /etc/apache2/sites-available/project2.lan.conf
#<VirtualHost *:80>
#   ServerAdmin root@localhost
#   ServerName project2.lan
#   ServerAlias www.project2.lan
#   DocumentRoot /var/www/html/project2.lan/public_html
#   ErrorLog ${APACHE_LOG_DIR}/project2.lan_error.log
#   CustomLog ${APACHE_LOG_DIR}/project2.lan_access.log combined
#</VirtualHost>
#EOF



#a2dissite 000-default.conf
#a2ensite project2.lan.conf


#systemctl restart apache2
systemctl enable apache2
