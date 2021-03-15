variable "instance_name" {
        description = "name of instance"
		type = string
        }
		
variable "image_id" {
        description = "id of the image"
		}
        
variable "flavor_name" {
        description = "name of flavor"
		type = string
        }
		
variable "key_pair" {
        description = "name of key"
		type = string
        }

variable "security_groups" {
        description = "list of security groups"
		type =list(string)
        }
		
variable "tf_environment" {
        description = "name of environment"
		type = string
        }
		
variable "private_network" {
        description = "name of private network"
		type = string
        }

/*
variable "private_ip" {
        description = "name of private network"
		type = string
        }
*/
