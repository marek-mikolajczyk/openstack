resource "openstack_compute_keypair_v2" "all_os-keypair" {
  name       = var.pubkey_name
  public_key = file("/root/marekexample/git/openstack/project_all_os/secrets/project_all_os-keypair.pub")
}
