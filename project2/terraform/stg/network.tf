module "private_network" {
        source = "../modules/stg/network/"

        private_network_name    = "project2-private-network"
	subnet_name	= "project2-subnet"
	secgroup1_name	= "project2-secgroup1"
}
