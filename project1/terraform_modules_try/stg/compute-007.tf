module "instance-007" {
	source = "../modules/compute"

	compute_name	= "ins-007"
	image_number	= "961b5f57-9d4d-455b-be7b-c6ec098dec37"
  	flavor_number	= "9dbd2255-0da4-433b-a137-2eb5d3c6fb0b"
	volume_name		= "vol-007"
	instance_environment 	= "stg"

}