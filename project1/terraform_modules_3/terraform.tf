terraform {
  backend "swift" {
    cloud = "project1"
    container = "project1_3" 
    archive_container = "project1_3_archive" 
    } 
}
