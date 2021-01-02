data  "openstack_images_image_v2" "webserver_shell_script" {
  name        = "project3_ubuntu_webserver_shell_script"
  most_recent = true
}


module "webserver_instance" {
	source = "../modules/stg/compute/"
  depends_on = [
      module.private_network
      ]

	instance_name	= "webserver"
	image_id		= data.openstack_images_image_v2.webserver_shell_script.id
    flavor_name		= "c1m1"
#	volume_name		= "webserver_os"
	key_pair		= "project3-keypair"
	security_groups = ["project3-secgroup1"]
	private_network = "project3-private-network"
	tf_environment	= "stg"
	private_ip		= "192.168.200.3"

}

resource "openstack_networking_floatingip_v2" "webserver-floating_ip" {
  pool = "external_network"
}



resource "openstack_compute_floatingip_associate_v2" "webserver-floating_ip_associate" {
  floating_ip = openstack_networking_floatingip_v2.webserver-floating_ip.address
  instance_id = module.webserver_instance.instance_id
}


data  "openstack_images_image_v2" "ubuntu" {
  name        = "project3_ubuntu_webserver_shell_script"
  most_recent = true
}
