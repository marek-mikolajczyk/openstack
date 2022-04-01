resource "openstack_compute_instance_v2" "admin_003" {
  name            = "admin_003"
  image_name      = "centos_84"
  flavor_name     = "marekexample_small_c1m1024d10"
  key_pair        = "admin-keypair"
  security_groups = ["secgroup_1"]

  network {
    name = "network_1"
  }
}


resource "openstack_networking_floatingip_v2" "admin_003-floating_ip" {
  pool = "external_network"
}


resource "openstack_compute_floatingip_associate_v2" "admin_003-floating_ip_associate" {
  floating_ip = openstack_networking_floatingip_v2.admin_003-floating_ip.address
  instance_id = openstack_compute_instance_v2.admin_003.id
}
