#!/bin/bash

openstack project create --enable project1
openstack user create --project project1 --password foo --email root@localhost --enable project1
export OS_USERNAME=project1
export OS_TENANT_NAME=project1
export OS_PASSWORD=foo
neutron router-create router1
neutron router-gateway-set router1 external_network
neutron net-create private_network
neutron subnet-create --name private_subnet private_network 192.168.100.0/24
neutron router-interface-add router1 private_subnet
