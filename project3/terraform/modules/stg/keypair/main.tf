resource "openstack_compute_keypair_v2" "project3-keypair" {
  name       = var.pubkey_name
  public_key = file("/root/marekexample/git/openstack/project3/secrets/project3-keypair.pub")
}
