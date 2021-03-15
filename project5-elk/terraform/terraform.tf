terraform {
  backend "swift" {
    cloud = "project5-elk"
    container = "project5-elk"
    archive_container = "project5-elk_archive"
    }
}
