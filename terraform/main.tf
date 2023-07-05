# Configure the OpenStack Provider
provider "openstack" {
  user_name   = var.openstack_user_name
  tenant_name = var.openstack_tenant_name
  password    = module.openstack-install.openstack_admin_password
  auth_url    = "http://${var.openstack_external_ip}/identity"
}

module "openstack-install" {
  source                  = "./modules/ops-install/"
  openstack_external_ip   = var.openstack_external_ip
  openstack_user_name     = var.openstack_user_name
  openstack_tenant_name   = var.openstack_tenant_name
  openstack_password      = var.openstack_password
  openstack_ssh_user      = var.openstack_ssh_user
  openstack_sudo_password = var.openstack_sudo_password
  openstack_ssh_key       = var.openstack_ssh_key

}

