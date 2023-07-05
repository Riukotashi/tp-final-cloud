variable "openstack_user_name" {
  type = string
}

variable "openstack_tenant_name" {
  type = string
}

variable "openstack_password" {
  type = string
}

variable "openstack_ssh_user" {
  type = string
}

variable "openstack_sudo_password" {
  type = string
}

variable "openstack_ssh_key" {
  type = string
}

variable "openstack_external_ip" {
  type = string
}

variable "instances" {
  type = map(object({
    instance_image = string
    init_script    = string
  }))
}

variable "volumes" {
  type = map(object({
    size = number
  }))
}

variable "default_instance_keypair_path" {
  type        = string
  description = "Default instance keypair"
}
