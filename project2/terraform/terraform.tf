terraform {
  backend "swift" {
    cloud = "project2"
    container = "project2"
    archive_container = "project2_archive"
    }
}
