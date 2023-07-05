resource "openstack_compute_instance_v2" "instances" {
  for_each = var.instances
  name            = each.key
  image_name        = each.value.instance_image
  flavor_id       = openstack_compute_flavor_v2.cloud-tiny.flavor_id
  key_pair        = openstack_compute_keypair_v2.main-keypair.name
  security_groups = [openstack_compute_secgroup_v2.secgroup_1.name]
#   user_data = 

  network {
    name = "network_1"
  }
}

