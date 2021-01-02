terraform {
  backend "swift" {
    cloud = "project1"
    container = "project1_4" 
    archive_container = "project1_4_archive" 
    } 
}
