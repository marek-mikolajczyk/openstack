module "private_network" {
        source = "../modules/stg/network/"

  private_network_name    = "all_os-private-network"
	subnet_name	= "all_os-subnet"
	secgroup1_name	= "all_os-secgroup1"
}
