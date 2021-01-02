module "instance-008" {
	source = "../modules/compute"

	compute_name	= "ins-008"
    flavor_name	= "c1m1"
	volume_name		= "vol-008"
	instance_environment 	= "stg"

}