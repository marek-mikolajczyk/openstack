data  "openstack_images_image_v2" "centos7" {
  name        = "centos7"
  most_recent = true
}

module "centos7_instance" {
	source = "../modules/stg/compute/"
  depends_on = [
      module.private_network
      ]

	instance_name	= "centos7"
	image_id		= data.openstack_images_image_v2.centos7.id
    flavor_name		= "c1m2"
#	volume_name		= "centos7_os"
	key_pair		= "all_os-keypair"
	security_groups = ["all_os-secgroup1"]
	private_network = "all_os-private-network"
	tf_environment	= "stg"
}

/*
module "centos7_volume" {
	source = "../modules/stg/volume/"

	volume_name		= "centos7-data"
	volume_size		= "2"
    instance_id		= module.centos7_instance.instance_id
	volume_id		= var.openstack_blockstorage_volume_v2.volume.id
}

resource "openstack_blockstorage_volume_v2" "centos7_data_volume" {
  name = "centos7_data"
  size = "2"
}

resource "openstack_compute_volume_attach_v2" "centos7_volume_attached" {
  instance_id = module.centos7_instance.instance_id
  volume_id   = openstack_blockstorage_volume_v2.centos7_data_volume.id
}

*/




resource "openstack_compute_floatingip_v2" "centos7-floating_ip" {
  pool = "external_network"
}



resource "openstack_compute_floatingip_associate_v2" "centos7-floating_ip_associate" {
  floating_ip = openstack_compute_floatingip_v2.centos7-floating_ip.address
  instance_id = module.centos7_instance.instance_id


}
