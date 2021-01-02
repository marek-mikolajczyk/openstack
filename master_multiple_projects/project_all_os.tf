resource "openstack_identity_project_v3" "project_all_os" {
  name        = "all_os"
}

resource "openstack_identity_user_v3" "admin_user_all_os" {
  default_project_id = openstack_identity_project_v3.project_all_os.id
  name               = "all_os-admin"
  description        = "Admin account"
  password 			 = "foo"
  ignore_change_password_upon_first_use = true
}

resource "openstack_identity_role_assignment_v3" "role_admin_to_user_assignment_all_os" {
  user_id  	 = openstack_identity_user_v3.admin_user_all_os.id
  project_id = openstack_identity_project_v3.project_all_os.id
  role_id    = data.openstack_identity_role_v3.admin.id
}

resource "openstack_objectstorage_container_v1" "project_bucket_all_os" {
  region = "RegionOne"
  name   = "all_os"
}


resource "openstack_objectstorage_container_v1" "project_bucket_archive_all_os" {
  region = "RegionOne"
  name   = "all_os_archive"
}
