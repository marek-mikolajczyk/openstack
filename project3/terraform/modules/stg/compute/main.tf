resource "openstack_compute_instance_v2" "instance" {
  name            = var.instance_name
  image_id        = var.image_id
  flavor_name       = var.flavor_name
  key_pair        = var.key_pair
  security_groups = var.security_groups

  metadata = {
    environment = var.tf_environment
  }

  network {
    name = var.private_network
    fixed_ip_v4 = var.private_ip
  }
}
