resource "openstack_compute_instance_v2" "instance" {
  name            = var.instance_name
  image_id        = var.image_id
  flavor_name       = var.flavor_name
  key_pair        = var.key_pair
  security_groups = var.security_groups

  metadata = {
    environment = var.tf_environment
  }

  network {
    name = var.private_network
  }


/*    connection {
    user        = "ubuntu"
    host        = "${openstack_networking_port_v2.port_1.fixed_ip.0.ip_address}"
    private_key = "~/path/to/key"
  }



  provisioner "remote-exec" {
     inline = ["sudo hostnamectl set-hostname friendly.example.com"]
  }
*/

}
