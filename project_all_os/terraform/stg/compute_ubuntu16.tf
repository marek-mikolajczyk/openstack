data  "openstack_images_image_v2" "ubuntu16" {
  name        = "ubuntu16"
  most_recent = true
}

module "ubuntu16_instance" {
	source = "../modules/stg/compute/"
  depends_on = [
      module.private_network
      ]

	instance_name	= "ubuntu16"
	image_id		= data.openstack_images_image_v2.ubuntu16.id
    flavor_name		= "c1m512"
#	volume_name		= "ubuntu16_os"
	key_pair		= "all_os-keypair"
	security_groups = ["all_os-secgroup1"]
	private_network = "all_os-private-network"
	tf_environment	= "stg"
}

/*
module "ubuntu16_volume" {
	source = "../modules/stg/volume/"

	volume_name		= "ubuntu16-data"
	volume_size		= "2"
    instance_id		= module.ubuntu16_instance.instance_id
	volume_id		= var.openstack_blockstorage_volume_v2.volume.id
}

resource "openstack_blockstorage_volume_v2" "ubuntu16_data_volume" {
  name = "ubuntu16_data"
  size = "2"
}

resource "openstack_compute_volume_attach_v2" "ubuntu16_volume_attached" {
  instance_id = module.ubuntu16_instance.instance_id
  volume_id   = openstack_blockstorage_volume_v2.ubuntu16_data_volume.id
}

*/




resource "openstack_compute_floatingip_v2" "ubuntu16-floating_ip" {
  pool = "external_network"
}



resource "openstack_compute_floatingip_associate_v2" "ubuntu16-floating_ip_associate" {
  floating_ip = openstack_compute_floatingip_v2.ubuntu16-floating_ip.address
  instance_id = module.ubuntu16_instance.instance_id


}
