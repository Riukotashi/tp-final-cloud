variable "openstack_user_name" {
  type        = string
  description = "Open stack name"
}

variable "openstack_tenant_name" {
  type        = string
  default     = ""
  description = "description"
}

variable "openstack_password" {
  type        = string
  default     = ""
  description = "description"
}

variable "openstack_ssh_user" {
  type        = string
  description = "description"
}

variable "openstack_sudo_password" {
  type        = string
  description = "description"
}

variable "openstack_ssh_key" {
  type        = string
  description = "description"
}

variable "openstack_external_ip" {
  type        = string
  description = "description"
}