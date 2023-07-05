
# Create a web server
resource "openstack_compute_instance_v2" "test-server" {
  name = "toto"
}