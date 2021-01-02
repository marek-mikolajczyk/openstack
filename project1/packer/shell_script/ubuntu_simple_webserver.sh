#!/bin/bash -x

APACHEUSER=www-data


echo "INSTALL APACHE"
apt-get update; apt-get install apache2

echo "CONFIGURE VHOSTS"
mkdir -p /var/www/html/vhost1.lan/public_html /var/www/html/vhost2.lan/public_html
chown -R $APACHEUSER:$APACHEUSER /var/www/html/vhost{1,2}.lan/public_html
chmod -R 755 /var/www/html/

cat <<EOF >> /var/www/html/vhost1.lan/public_html/index.html
<html>
 <head>
 <title>vhost1 test</title>
 </head>
 <body>
 <h1>Hello, This is a test page for vhost1.lan website</h1>
 </body>
</html>
EOF

cat <<EOF >> /var/www/html/vhost2.lan/public_html/index.html
<html>
 <head>
 <title>vhost1 test</title>
 </head>
 <body>
 <h1>Hello, This is a test page for vhost2.lan website</h1>
 </body>
</html>
EOF


#cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/vhost1.lan.conf
#cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/vhost2.lan.conf
#mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.bkp


cat <<EOF > /etc/apache2/sites-available/vhost1.lan.conf
<VirtualHost *:80>
   ServerAdmin root@vhost1.lan
   ServerName vhost1.lan
   ServerAlias www.vhost1.lan
   DocumentRoot /var/www/html/vhost1.lan/public_html
   ErrorLog ${APACHE_LOG_DIR}/vhost1.lan_error.log
   CustomLog ${APACHE_LOG_DIR}/vhost1.lan_access.log combined
</VirtualHost>
EOF


cat <<EOF > /etc/apache2/sites-available/vhost2.lan.conf
<VirtualHost *:80>
   ServerAdmin root@vhost2.lan
   ServerName vhost2.lan
   ServerAlias www.vhost2.lan
   DocumentRoot /var/www/html/vhost2.lan/public_html
   ErrorLog ${APACHE_LOG_DIR}/vhost2.lan_error.log
   CustomLog ${APACHE_LOG_DIR}/vhost2.lan_access.log combined
</VirtualHost>
EOF

a2dissite 000-default.conf
a2ensite vhost1.lan.conf
a2ensite vhost2.lan.conf


systemctl restart apache2
systemctl enable apache2