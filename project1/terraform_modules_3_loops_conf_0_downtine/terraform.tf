/*
terraform {
  backend "swift" {
    cloud = "project1"
    container = "project1_3" 
    archive_container = "project1_3_archive" 
    } 

}
*/

terraform {
  backend "local" {
    path = "/tmp/tf/terraform_3_.tfstate"
  }
}
