resource "openstack_blockstorage_volume_v2" "vol-006" {
  name = "vol-006"
  size = 1
}

resource "openstack_compute_instance_v2" "ins-006" {
  name            = "ins-006"
  image_id        = "512b4772-e26c-4667-886c-dc9bf71f5e32"
  flavor_name       = "c1m1"
  key_pair        = "project1-keypair"
  security_groups = ["default"]

  network {
    name = "private_network"
  }
}

resource "openstack_compute_volume_attach_v2" "vol-006" {
  instance_id = openstack_compute_instance_v2.ins-006.id
  volume_id   = openstack_blockstorage_volume_v2.vol-006.id
}

resource "openstack_networking_floatingip_v2" "ip-006" {
  pool = "external_network"
}


resource "openstack_compute_floatingip_associate_v2" "ip-006" {
  floating_ip = openstack_networking_floatingip_v2.ip-006.address
  instance_id = openstack_compute_instance_v2.ins-006.id
}

output "ins-006_private_ip" {
  value       = openstack_compute_instance_v2.ins-006.access_ip_v4
  description = "The private IP of the server"
}

output "ins-006_public_ip" {
  value       = openstack_networking_floatingip_v2.ip-006.address
  description = "The public IP of the server"
}
