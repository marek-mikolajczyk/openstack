resource "openstack_compute_flavor_v2" "marekexample_micro_c1m256d3" {
  name      = "marekexample_micro_c1m256d1"
  ram       = "256"
  vcpus     = "1"
  disk      = "1"
  is_public = true

}

resource "openstack_compute_flavor_v2" "marekexample_tiny_c1m512d3" {
  name      = "marekexample_tiny_c1m512d3"
  ram       = "512"
  vcpus     = "1"
  disk      = "3"
  is_public = true
}

resource "openstack_compute_flavor_v2" "marekexample_small_c1m1024d5" {
  name      = "marekexample_small_c1m1024d5"
  ram       = "1024"
  vcpus     = "1"
  disk      = "5"
  is_public = true
}

resource "openstack_compute_flavor_v2" "marekexample_small_c1m1024d10" {
  name      = "marekexample_small_c1m1024d10"
  ram       = "1024"
  vcpus     = "1"
  disk      = "10"
  is_public = true
}