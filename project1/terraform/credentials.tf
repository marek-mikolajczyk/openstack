variable "openstack_user_name" {
	description = "The username for the Tenant."
	default  = "project1" 
	}
	
variable "openstack_tenant_name" {
	description = "The name of the Tenant."
	default  = "project1" 
	}
variable "openstack_password" {
	description = "The password for the Tenant."
	default  = "foo" 
	}
variable "openstack_auth_url" {
	description = "The endpoint url to connect to OpenStack."
	default  = "http://192.168.0.12:5000/v3" 
	}
variable "openstack_keypair" {
	description = "The keypair to be used."
	default  = "../project1-keypair.pem" 
	}
variable "tenant_network" {
	description = "The network to be used."
	default  = "private_network" 
	}

variable "region" {
	description = "The default region."
	default  = "RegionOne" 
	}

