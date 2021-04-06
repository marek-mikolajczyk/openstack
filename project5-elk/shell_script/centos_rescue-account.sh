#!/bin/bash -x

echo "ADDING USER"
useradd --shell /bin/bash  rescue-account

echo "CHANGING PASSWORD"
echo 'rescue-account:$6$HZduLxwxMeBvZ36c$ijQltKesayQT6JdrlVnPdUQfJbebDwmwAv7nw7FRA984nW.je.dNHLjlXk/uDG1a2lD7Y.cuaTFLupc7L9RB20' | chpasswd -e 

echo "ADDING SUDO"
echo 'rescue-account    ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

echo "CONFIGURE SSH KEY"
mkdir /home/rescue-account/.ssh
touch /home/rescue-account/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1dspza9n3vj5itIPc49gyHvTHIALP5eJxaV8Xr32c7j1zCqc6DbcBnsQdZbcu2cs1UzgSJRWegDLWcJTP4kOASQMV8qs3ScFphGMuGZ+XZFL1PHNOiMfA0lIL2XLWqc8nWZpkxTJNPmPZJvYz/RUki1GLua5g+AZm+Yful+WF/bQmA7/v+GRXEFA1gPXZoCHZNcOjDRfHfKGeXcMXThPSwBZEMwW+f/aAMWoQnsDsc8MMdtv6Sop66dJxJtHWFhHjY9aXU8kw0agiKaalh+GHNAJsrtXJJrElfjhhE99V0wgVhexHiqYEunJmoDViMrk7DAF+wAf90qp1z2L5T3Fn project2@admin" >> /home/rescue-account/.ssh/authorized_keys
chmod 700 /home/rescue-account/.ssh
chmod 600 /home/rescue-account/.ssh/authorized_keys
chown -R rescue-account:rescue-account /home/rescue-account
