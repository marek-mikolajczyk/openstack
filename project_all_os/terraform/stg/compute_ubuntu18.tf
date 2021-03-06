data  "openstack_images_image_v2" "ubuntu18" {
  name        = "ubuntu18"
  most_recent = true
}

module "ubuntu18_instance" {
	source = "../modules/stg/compute/"
  depends_on = [
      module.private_network
      ]

	instance_name	= "ubuntu18"
	image_id		= data.openstack_images_image_v2.ubuntu18.id
    flavor_name		= "c1m1"
#	volume_name		= "ubuntu18_os"
	key_pair		= "all_os-keypair"
	security_groups = ["all_os-secgroup1"]
	private_network = "all_os-private-network"
	tf_environment	= "stg"
}

/*
module "ubuntu18_volume" {
	source = "../modules/stg/volume/"

	volume_name		= "ubuntu18-data"
	volume_size		= "2"
    instance_id		= module.ubuntu18_instance.instance_id
	volume_id		= var.openstack_blockstorage_volume_v2.volume.id
}

resource "openstack_blockstorage_volume_v2" "ubuntu18_data_volume" {
  name = "ubuntu18_data"
  size = "2"
}

resource "openstack_compute_volume_attach_v2" "ubuntu18_volume_attached" {
  instance_id = module.ubuntu18_instance.instance_id
  volume_id   = openstack_blockstorage_volume_v2.ubuntu18_data_volume.id
}


*/



resource "openstack_compute_floatingip_v2" "ubuntu18-floating_ip" {
  pool = "external_network"
}



resource "openstack_compute_floatingip_associate_v2" "ubuntu18-floating_ip_associate" {
  floating_ip = openstack_compute_floatingip_v2.ubuntu18-floating_ip.address
  instance_id = module.ubuntu18_instance.instance_id


}
