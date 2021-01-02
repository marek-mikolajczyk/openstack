terraform {
  backend "swift" {
    cloud = "project1"
    container = "project1_2" 
    archive_container = "project1_2_archive" 
    } 
}
