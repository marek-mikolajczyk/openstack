#!/bin/bash

ansible-playbook -i openstack.inv -u root -k --ask-vault-pass roles_packstack-configure.yml
