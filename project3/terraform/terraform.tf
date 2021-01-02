terraform {
  backend "swift" {
    cloud = "project3"
    container = "project3"
    archive_container = "project3_archive"
    }
}
