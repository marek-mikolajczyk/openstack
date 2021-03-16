data  "openstack_images_image_v2" "webserver_shell_script" {
  name        = "project5-elk_shell_script"
  most_recent = true
}


module "webserver_instance" {
	source = "../modules/stg/compute/"
  depends_on = [
      module.private_network
      ]

  for_each = toset( ["1", "2", "3" ] ) 

	instance_name	= "webserver-${each.key}"

	image_id		= data.openstack_images_image_v2.webserver_shell_script.id
    flavor_name		= "c1m1"
	key_pair		= "project5-elk-keypair"
	security_groups = ["project5-elk-secgroup1"]
	private_network = "project5-elk-private-network"
	tf_environment	= "stg"

  
}

resource "openstack_networking_floatingip_v2" "webserver-floating_ip" {
  pool = "external_network"
  for_each = toset( ["1", "2", "3" ] )
}

resource "openstack_compute_floatingip_associate_v2" "webserver-floating_ip_associate" {
  for_each = toset( ["1", "2", "3" ] )

  floating_ip = openstack_networking_floatingip_v2.webserver-floating_ip[each.key].address
#  instance_id = module.webserver_instance.instance_id
  instance_id = module.webserver_instance[each.key].instance_id

}

