module "private_network" {
        source = "../modules/stg/network/"

        private_network_name    = "project5-elk-private-network"
	subnet_name	= "project5-elk-subnet"
	secgroup1_name	= "project5-elk-secgroup1"
}
