module "instances-db" {
	source = "../modules/stg/compute/"

	compute_name	= "ins-db-1"
    flavor_name		= "c1m1"
	volume_name		= "vol-ins-db-1-1"
	instance_environment 	= local.instance_environment_local	
}