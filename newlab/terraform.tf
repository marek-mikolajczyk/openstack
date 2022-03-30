terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
  backend "swift" {
    container         = "terraform-state-admin"
    archive_container = "terraform-state-admin-archive"
  }
}

# use environmental variables in your .bashrc profile
# OS_PASSWORD
provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  auth_url    = "http://192.168.0.72:5000/v3"
  region      = "RegionOne"
}
