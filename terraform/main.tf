# Configure the OpenStack Provider
provider "openstack" {
  user_name   = var.openstack_user_name
  tenant_name = var.openstack_tenant_name
  password    = module.openstack-install.openstack_admin_password
  auth_url    = "http://${var.openstack_external_ip}/identity"
}

module "openstack-install" {
  source = "./modules/ops-install/"
  openstack_external_ip   = var.openstack_external_ip
  openstack_user_name     = "admin"
  openstack_tenant_name   = "admin"
  openstack_password      = "secret"
  openstack_ssh_user      = "openstack"
  openstack_sudo_password = "openstack"
  openstack_ssh_key       = "/home/kevin/.ssh/id_rsa"

}

