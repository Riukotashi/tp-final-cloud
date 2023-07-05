output "openstack_admin_password" {
  value     = random_password.openstack_admin_password.result
  sensitive = true
}