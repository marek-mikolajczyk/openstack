data "openstack_identity_project_v3" "project1" {
  name = "project1"
}


/*resource "openstack_identity_user_v3" "user1" {

  count = 3

  default_project_id = data.openstack_identity_project_v3.project1.id
  name               = "user-${count.index}"
  description        = "A user"

  password = "password123"
}
*/

resource "openstack_identity_user_v3" "user2" {


  default_project_id = data.openstack_identity_project_v3.project1.id
  count             = length(var.user_names)
  name               = var.user_names[count.index]
  description        = "An user"

  password = "password123"

}


resource "openstack_identity_user_v3" "user3" {

  default_project_id = data.openstack_identity_project_v3.project1.id



  for_each = toset(var.user_names2)
  name               = each.value


  description        = "An user"
  password = "password123"

/*  extra = {
    email = 
  }
*/
}