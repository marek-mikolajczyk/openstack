resource "openstack_identity_project_v3" "project_project3" {
  name        = "project3"
}

resource "openstack_identity_user_v3" "admin_user_project3" {
  default_project_id = openstack_identity_project_v3.project_project3.id
  name               = "project3-admin"
  description        = "Admin account"
  password 			 = "foo"
  ignore_change_password_upon_first_use = true
}

resource "openstack_identity_role_assignment_v3" "role_admin_to_user_assignment_project3" {
  user_id  	 = openstack_identity_user_v3.admin_user_project3.id
  project_id = openstack_identity_project_v3.project_project3.id
  role_id    = data.openstack_identity_role_v3.admin.id
}

resource "openstack_objectstorage_container_v1" "project_bucket_project3" {
  region = "RegionOne"
  name   = "project3"
}


resource "openstack_objectstorage_container_v1" "project_bucket_archive_project3" {
  region = "RegionOne"
  name   = "project3_archive"
}
