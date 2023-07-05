resource "openstack_compute_keypair_v2" "main-keypair" {
  name       = "main-keypair"
  public_key = file("${var.default_instance_keypair_path}")
}