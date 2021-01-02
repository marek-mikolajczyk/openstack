resource "openstack_networking_network_v2" "private_network" {
  name           = var.private_network_name
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  name       = var.subnet_name
  network_id = openstack_networking_network_v2.private_network.id
  cidr       = "192.168.200.0/24"
  ip_version = 4
  dns_nameservers = ["192.168.0.1", "8.8.8.8"]
}

resource "openstack_compute_secgroup_v2" "secgroup_1" {
  name        = var.secgroup1_name
  description = "a security group"
}

resource "openstack_networking_secgroup_rule_v2" "subnet-in-ssh" {
  description       = "allow SSH traffic from LAN"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "192.168.0.0/24"
  security_group_id = openstack_compute_secgroup_v2.secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "subnet-in-nfs" {
  description       = "allow NFS traffic inside subnet"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 2049
  port_range_max    = 2049
  remote_ip_prefix  = "192.168.200.0/24"
  security_group_id = openstack_compute_secgroup_v2.secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "public-in-http" {
  description       = "allow HTTP traffic from LAN"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "192.168.0.0/24"
  security_group_id = openstack_compute_secgroup_v2.secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "public-out-all-tcp" {
  description       = "allow all traffic outside subnet"
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_compute_secgroup_v2.secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "public-out-all-udp" {
  description       = "allow all traffic outside subnet"
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_compute_secgroup_v2.secgroup_1.id
}


resource "openstack_networking_router_v2" "router" {
  name                = "project3-router"
  admin_state_up      = true
  external_network_id = data.openstack_networking_network_v2.external_network.id
}


resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet.id
}
