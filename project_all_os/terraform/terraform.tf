terraform {
  backend "swift" {
    cloud = "all_os"
    container = "all_os"
    archive_container = "all_os_archive"
    }
}
