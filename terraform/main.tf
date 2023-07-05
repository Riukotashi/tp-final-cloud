

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = var.openstack_user_name
  tenant_name = var.openstack_tenant_name
  password    = var.openstack_password
  auth_url    = var.openstack_auth_url
  #   region      = 
}

resource "null_resource" "ssh_target" {
  connection {
    type        = "ssh"
    user        = var.openstack_ssh_user
    host        = var.openstack_external_ip
    private_key = file(var.openstack_ssh_key)
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "curl -fsSL https://get.docker.com -o get-docker.sh",
      "sudo chmod 755 get-docker.sh",
      "sudo ./get-docker.sh >/dev/null"
    ]
  }
  # provisioner "file" {
  #     source        = "${path.module}/startup-options.conf"
  #     destination    = "/tmp/startup-options.conf"
  #         }

}

