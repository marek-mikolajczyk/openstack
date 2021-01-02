module "instance-009" {
	source = "../modules/stg/compute/"

	compute_name	= "ins-009"
    flavor_name		= "c1m1"
	volume_name		= "vol-ins-009"
	instance_environment 	= local.instance_environment_local

	

}
module "instance-010" {
	source = "../modules/stg/compute/"

	compute_name		= "ins-010"
  	flavor_name			= "c1m1"
	volume_name		= "vol-ins-10"
	instance_environment 	= local.instance_environment_local

	
}

# this shows undeclared
/*output "my_private_ip" {
  value       = module.compute.access_ip_v4
  description = "The private IP of the server"
}
*/
/*
output "public_ip" {
  value       = 
  description = "The public IP of the server"
}


*/

# This object does not have an attribute named "output_ip4".
/*
output "my_private_ip4" {
  value       = module.instance-009.output_ip4
  description = "The private IP of the server"
}
*/