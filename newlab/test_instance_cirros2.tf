resource "openstack_compute_instance_v2" "admin_004" {
  name            = "admin_004"
  image_name      = "cirros_052"
  flavor_name     = "marekexample_micro_c1m256d1"
  key_pair        = "admin-keypair"
  security_groups = ["secgroup_1"]

  network {
    name = "private_network"
  }
}


resource "openstack_networking_floatingip_v2" "admin_004-floating_ip" {
  pool = "external_network"
}


resource "openstack_compute_floatingip_associate_v2" "admin_004-floating_ip_associate" {
  floating_ip = openstack_networking_floatingip_v2.admin_004-floating_ip.address
  instance_id = openstack_compute_instance_v2.admin_004.id
}
