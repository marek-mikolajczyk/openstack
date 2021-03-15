data "openstack_networking_network_v2" "external_network" {
  name = "external_network"
}


resource "openstack_identity_project_v3" "project_project5-elk" {
  name        = "project5-elk"
}

resource "openstack_identity_user_v3" "admin_user_project5-elk" {
  default_project_id = openstack_identity_project_v3.project_project5-elk.id
  name               = "project5-elk-admin"
  description        = "Admin account"
  password                       = "foo"
  ignore_change_password_upon_first_use = true
}

resource "openstack_identity_role_assignment_v3" "role_admin_to_user_assignment_project5-elk" {
  user_id        = openstack_identity_user_v3.admin_user_project5-elk.id
  project_id = openstack_identity_project_v3.project_project5-elk.id
  role_id    = data.openstack_identity_role_v3.admin.id
}

resource "openstack_objectstorage_container_v1" "project_bucket_project5-elk" {
  region = "RegionOne"
  name   = "project5-elk"
}


resource "openstack_objectstorage_container_v1" "project_bucket_archive_project5-elk" {
  region = "RegionOne"
  name   = "project5-elk_archive"
}

locals {
  project_name = "project5-elk"
}

resource "openstack_networking_network_v2" "project5-elk-private_network" {
  name           = "project5-elk-private_network"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "project5-elk-subnet" {
  name       = "${local.project_name}-subnet"
  network_id = openstack_networking_network_v2.project5-elk-private_network.id
  cidr       = "192.168.200.0/24"
  ip_version = 4
  dns_nameservers = ["192.168.0.1", "8.8.8.8"]
}

resource "openstack_compute_secgroup_v2" "project5-elk-secgroup_1" {
  name        = "${local.project_name}-secgroup1"
  description = "a security group"
}

resource "openstack_networking_secgroup_rule_v2" "project5-elk-subnet-in-ssh" {
  description       = "allow SSH traffic from LAN"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "192.168.0.0/24"
  security_group_id = openstack_compute_secgroup_v2.project5-elk-secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "project5-elk-subnet-in-nfs" {
  description       = "allow NFS traffic inside subnet"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 2049
  port_range_max    = 2049
  remote_ip_prefix  = "192.168.200.0/24"
  security_group_id = openstack_compute_secgroup_v2.project5-elk-secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "project5-elk-public-in-http" {
  description       = "allow HTTP traffic from LAN"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "192.168.0.0/24"
  security_group_id = openstack_compute_secgroup_v2.project5-elk-secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "project5-elk-public-out-all-tcp" {
  description       = "allow all traffic outside subnet"
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_compute_secgroup_v2.project5-elk-secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "project5-elk-public-out-all-udp" {
  description       = "allow all traffic outside subnet"
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_compute_secgroup_v2.project5-elk-secgroup_1.id
}


resource "openstack_networking_router_v2" "project5-elk-router" {
  name                = "project5-elk-router"
  admin_state_up      = true
  external_network_id = data.openstack_networking_network_v2.external_network.id
}


resource "openstack_networking_router_interface_v2" "project5-elk-router_interface" {
  router_id = openstack_networking_router_v2.project5-elk-router.id
  subnet_id = openstack_networking_subnet_v2.project5-elk-subnet.id
}
