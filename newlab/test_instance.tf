resource "openstack_compute_instance_v2" "admin_001" {
  name            = "admin_001"
  image_name      = "ubuntu_2004"
  flavor_name     = "marekexample_small_c1m1024d5"
  key_pair        = "admin-keypair"
  security_groups = ["secgroup_1"]

  block_device {
    uuid                  = "83bb3ac8-313b-4cce-b3f2-85ad0bdebe98"
    source_type           = "image"
    volume_size           = 3
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  network {
    name = "external_network"
  }
}

/*
resource "openstack_networking_floatingip_v2" "admin_001-floating_ip" {
  pool = "external_network"
}


resource "openstack_compute_floatingip_associate_v2" "admin_001-floating_ip_associate" {
  floating_ip = openstack_networking_floatingip_v2.admin_001-floating_ip.address
  instance_id = openstack_compute_instance_v2.admin_001.id
}
*/