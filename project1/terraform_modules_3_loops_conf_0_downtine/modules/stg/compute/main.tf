data  "openstack_images_image_v2" "ubuntu" {
  name        = "ubuntu20.4_shell_script"
  most_recent = true
}

resource "openstack_blockstorage_volume_v2" "volume" {
  name = var.volume_name
  size = 1
}

resource "openstack_compute_instance_v2" "compute" {
  name            = "${var.instance_environment}-${var.compute_name}"
  image_id        = data.openstack_images_image_v2.ubuntu.id
  flavor_name     = var.flavor_name
  key_pair        = "project1-keypair"
  security_groups = ["default"]
  tags            = [var.instance_environment]
  

  network {
    name = "private_network"
  }
}

resource "openstack_compute_volume_attach_v2" "volume_attach" {
  instance_id = openstack_compute_instance_v2.compute.id
  volume_id   = openstack_blockstorage_volume_v2.volume.id
}

resource "openstack_networking_floatingip_v2" "floating_ip" {
  pool = "external_network"
}


resource "openstack_compute_floatingip_associate_v2" "floating_ip_associate" {
  floating_ip = openstack_networking_floatingip_v2.floating_ip.address
  instance_id = openstack_compute_instance_v2.compute.id
}
