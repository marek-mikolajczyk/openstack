/*

resource "openstack_images_image_v2" "cirros_052" {
  name             = "cirros_052"
  image_source_url = "http://download.cirros-cloud.net/0.5.2/cirros-0.5.2-x86_64-disk.img"
  container_format = "bare"
  disk_format      = "qcow2"
  visibility       = "public"


  properties = {
    version = "0.5.2"
  }
}



resource "openstack_images_image_v2" "ubuntu_2110_minimal" {
  name             = "ubuntu_2110_minimal"
  image_source_url = "https://cloud-images.ubuntu.com/minimal/releases/impish/release/ubuntu-21.10-minimal-cloudimg-amd64.img"
  container_format = "bare"
  disk_format      = "qcow2"
  visibility       = "public"

  properties = {
    version = "21.10"
  }
}


resource "openstack_images_image_v2" "ubuntu_2004" {
  name             = "ubuntu_2004"
  image_source_url = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
  container_format = "bare"
  disk_format      = "qcow2"
  visibility       = "public"

  properties = {
    version = "20.04"
  }
}





resource "openstack_images_image_v2" "centos_84" {
  name             = "centos_84"
  image_source_url = "https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.4.2105-20210603.0.x86_64.qcow2"
  container_format = "bare"
  disk_format      = "qcow2"
  visibility       = "public"


  properties = {
    version = "0.5.2"
  }
}


*/