terraform {
  backend "swift" {
    cloud = "admin"
    container = "admin"
    archive_container = "admin_archive"
    }
}
