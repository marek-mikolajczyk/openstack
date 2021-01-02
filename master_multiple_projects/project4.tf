resource "openstack_identity_project_v3" "project_project4" {
  name        = "project4"
}

resource "openstack_identity_user_v3" "admin_user_project4" {
  default_project_id = openstack_identity_project_v3.project_project4.id
  name               = "project4-admin"
  description        = "Admin account"
  password 			 = "foo"
  ignore_change_password_upon_first_use = true
}

resource "openstack_identity_role_assignment_v3" "role_admin_to_user_assignment_project4" {
  user_id  	 = openstack_identity_user_v3.admin_user_project4.id
  project_id = openstack_identity_project_v3.project_project4.id
  role_id    = data.openstack_identity_role_v3.admin.id
}

resource "openstack_objectstorage_container_v1" "project_bucket_project4" {
  region = "RegionOne"
  name   = "project4"
}


resource "openstack_objectstorage_container_v1" "project_bucket_archive_project4" {
  region = "RegionOne"
  name   = "project4_archive"
}