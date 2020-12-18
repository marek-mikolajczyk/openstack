module "instance-008" {
	source = "../modules/compute"

	compute_name	= "ins-008"
	image_number	= "961b5f57-9d4d-455b-be7b-c6ec098dec37"
    flavor_number	= "9dbd2255-0da4-433b-a137-2eb5d3c6fb0b"
	volume_name		= "vol-008"

}