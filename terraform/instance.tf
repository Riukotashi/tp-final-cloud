resource "openstack_compute_instance_v2" "instances" {
  for_each        = var.instances
  name            = each.key
  image_name      = each.value.instance_image
  flavor_id       = openstack_compute_flavor_v2.cloud-tiny.flavor_id
  key_pair        = openstack_compute_keypair_v2.main-keypair.name
  security_groups = [openstack_compute_secgroup_v2.secgroup_1.name]
  user_data       = file("${path.module}/scripts/${each.value.init_script}")

  network {
    name = "network_1"
  }
}

resource "openstack_blockstorage_volume_v3" "volumes" {
  for_each = var.volumes
  name     = each.key
  size     = each.value.size
}

resource "openstack_compute_flavor_v2" "cloud-tiny" {
  name  = "cloud-tiny"
  ram   = "1024"
  vcpus = "1"
  disk  = "20"
}

resource "openstack_compute_keypair_v2" "main-keypair" {
  name       = "main-keypair"
  public_key = file("${var.default_instance_keypair_path}")
}