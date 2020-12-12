#!/bin/bash

packstack --allinone --provision-demo=n --os-neutron-ovn-bridge-mappings=extnet:br-ex --os-neutron-ovn-bridge-interfaces=br-ex:enp0s25
