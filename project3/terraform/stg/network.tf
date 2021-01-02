module "private_network" {
        source = "../modules/stg/network/"

        private_network_name    = "project3-private-network"
	subnet_name	= "project3-subnet"
	secgroup1_name	= "project3-secgroup1"
}
