resource "openstack_compute_keypair_v2" "project5-elk-keypair" {
  name       = var.pubkey_name
  public_key = file("/home/marek/github/openstack/project5-elk/secrets/project5-keypair.pub")
}
