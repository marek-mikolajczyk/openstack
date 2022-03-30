resource "openstack_compute_keypair_v2" "admin-keypair" {
  name       = "admin-keypair"
  public_key = file("secrets/id_rsa_admin.pub")
}
