resource "openstack_compute_instance_v2" "instance" {
  name              = var.instance_name
  image_id          = var.image_id
  flavor_name       = var.flavor_name
  key_pair          = var.key_pair
  security_groups   = var.security_groups
  user_data         = file("/root/marekexample/git/openstack/project_all_os/secrets/cloud_config.txt")

/*
  block_device {
    uuid                  = var.image_id
    source_type           = "image"
    volume_size           = 7 
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  block_device {
    source_type           = "blank"
    destination_type      = "volume"
    volume_size           = 1
    boot_index            = 1
    delete_on_termination = true
  }

*/
  network {
    name = var.private_network
  }

  metadata = {
    environment = var.tf_environment
  }
}
