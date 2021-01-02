data  "openstack_images_image_v2" "debian9" {
  name        = "debian9"
  most_recent = true
}

module "debian9_instance" {
	source = "../modules/stg/compute/"
  depends_on = [
      module.private_network
      ]

	instance_name	= "debian9"
	image_id		= data.openstack_images_image_v2.debian9.id
    flavor_name		= "c1m512"
#	volume_name		= "debian9_os"
	key_pair		= "all_os-keypair"
	security_groups = ["all_os-secgroup1"]
	private_network = "all_os-private-network"
	tf_environment	= "stg"
}

/*
module "debian9_volume" {
	source = "../modules/stg/volume/"

	volume_name		= "debian9-data"
	volume_size		= "2"
    instance_id		= module.debian9_instance.instance_id
	volume_id		= var.openstack_blockstorage_volume_v2.volume.id
}

resource "openstack_blockstorage_volume_v2" "debian9_data_volume" {
  name = "debian9_data"
  size = "2"
}

resource "openstack_compute_volume_attach_v2" "debian9_volume_attached" {
  instance_id = module.debian9_instance.instance_id
  volume_id   = openstack_blockstorage_volume_v2.debian9_data_volume.id
}

*/




resource "openstack_compute_floatingip_v2" "debian9-floating_ip" {
  pool = "external_network"
}



resource "openstack_compute_floatingip_associate_v2" "debian9-floating_ip_associate" {
  floating_ip = openstack_compute_floatingip_v2.debian9-floating_ip.address
  instance_id = module.debian9_instance.instance_id


}
