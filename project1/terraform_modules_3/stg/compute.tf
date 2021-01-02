module "instance-009" {
	source = "../modules/stg/compute/"

	compute_name	= "ins-009"
    flavor_name		= "c1m1"
	volume_name		= "vol-ins-009"
	instance_environment 	= local.instance_environment_local

}

module "instances-db" {
	source = "../modules/stg/compute/"

	count = "2"

	compute_name	= "ins-db-1-${count.index}"
    flavor_name		= "c1m1"
	volume_name		= "vol-ins-db-1-${count.index}"
	instance_environment 	= local.instance_environment_local	
}





# This object does not have an attribute named "output_ip4".
/*
output "my_private_ip4" {
  value       = module.instance-009.output_ip4
  description = "The private IP of the server"
}
*/