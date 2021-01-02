/*
terraform {
  backend "local" {
    path = "/tmp/tf/terraform.tfstate"
  }
}


*/

terraform {
  backend "swift" {
    cloud = "project1"
    container = "project1_simple" 
    archive_container = "project1_simple_archive" 
    } 
}
