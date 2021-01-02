module "instance-007" {
	source = "../modules/compute"

	compute_name	= "ins-007"
  	flavor_name	= "c1m1"
	volume_name		= "vol-007"
	instance_environment 	= "stg"

}