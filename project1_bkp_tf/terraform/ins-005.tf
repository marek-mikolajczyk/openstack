resource "openstack_blockstorage_volume_v2" "vol-005" {
  name = "vol-005"
  size = 1
}

resource "openstack_compute_instance_v2" "ins-005" {
  name            = "ins-005"
  image_id        = "512b4772-e26c-4667-886c-dc9bf71f5e32"
  flavor_id       = "9dbd2255-0da4-433b-a137-2eb5d3c6fb0b"
  key_pair        = "project1-keypair"
  security_groups = ["default"]

  network {
    name = "private_network"
  }
}

resource "openstack_compute_volume_attach_v2" "vol-005" {
  instance_id = openstack_compute_instance_v2.ins-005.id
  volume_id   = openstack_blockstorage_volume_v2.vol-005.id
}

resource "openstack_networking_floatingip_v2" "ip-005" {
  pool = "external_network"
}


resource "openstack_compute_floatingip_associate_v2" "ip-005" {
  floating_ip = openstack_networking_floatingip_v2.ip-005.address
  instance_id = openstack_compute_instance_v2.ins-005.id
}

output "ins-005_private_ip" {
  value       = openstack_compute_instance_v2.ins-005.access_ip_v4
  description = "The private IP of the server"
}

output "ins-005_public_ip" {
  value       = openstack_networking_floatingip_v2.ip-005.address
  description = "The public IP of the server"
}
