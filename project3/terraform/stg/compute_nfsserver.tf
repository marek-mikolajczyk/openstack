data  "openstack_images_image_v2" "nfsserver_shell_script" {
  name        = "project3_ubuntu_nfsserver_shell_script"
  most_recent = true
}

module "nfsserver_instance" {
	source = "../modules/stg/compute/"
  depends_on = [
      module.private_network
      ]

	instance_name	= "nfsserver"
	image_id		= data.openstack_images_image_v2.nfsserver_shell_script.id
    flavor_name		= "c1m1"
#	volume_name		= "nfsserver_os"
	key_pair		= "project3-keypair"
	security_groups = ["project3-secgroup1"]
	private_network = "project3-private-network"
	tf_environment	= "stg"
	private_ip		= "192.168.200.4"

}

/*
module "nfsserver_volume" {
	source = "../modules/stg/volume/"

	volume_name		= "nfsserver-data"
	volume_size		= "7"
    instance_id		= module.nfsserver_instance.instance_id
	volume_id		= var.openstack_blockstorage_volume_v2.volume.id
}
*/

resource "openstack_blockstorage_volume_v2" "nfs_volume" {
  name = "nfsserver_data"
  size = "7"
}

resource "openstack_compute_volume_attach_v2" "nfs_volume_attached" {
  instance_id = module.nfsserver_instance.instance_id
  volume_id   = openstack_blockstorage_volume_v2.nfs_volume.id
}





resource "openstack_networking_floatingip_v2" "nfsserver-floating_ip" {
  pool = "external_network"
}



resource "openstack_compute_floatingip_associate_v2" "nfsserver-floating_ip_associate" {
  floating_ip = openstack_networking_floatingip_v2.nfsserver-floating_ip.address
  instance_id = module.nfsserver_instance.instance_id


}


data  "openstack_images_image_v2" "ubuntu_nfs" {
  name        = "project3_ubuntu_nfsserver_shell_script"
  most_recent = true
}
