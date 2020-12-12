#!/bin/bash

#subscription-manager repos --enable=rhel-7-server-rpms
#subscription-manager repos --enable=rhel-7-server-rh-common-rpms
#subscription-manager repos --enable=rhel-7-server-extras-rpms
#subscription-manager repos --enable=rhel-7-server-openstack-13-rpms
#subscription-manager repos --enable=rhel-7-server-openstack-13-devtools-rpms

yum install yum-utils
yum update
systemctl disable NetworkManager
systemctl disable firewalld
systemctl enable network

systemctl reboot
