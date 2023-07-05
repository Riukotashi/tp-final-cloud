resource "random_password" "openstack_admin_password" {
  length  = 32
  special = false
}

resource "random_password" "openstack_service_password" {
  length  = 32
  special = false
}

resource "random_password" "openstack_database_password" {
  length  = 32
  special = false
}

resource "random_password" "openstack_rabbit_password" {
  length  = 32
  special = false
}

resource "null_resource" "openstack_ssh_target" {
  connection {
    type        = "ssh"
    user        = var.openstack_ssh_user
    host        = var.openstack_external_ip
    private_key = file(var.openstack_ssh_key)
  }
  provisioner "remote-exec" {
    inline = [
      "echo ${var.openstack_sudo_password} | sudo -S mkdir /opt/stack",
      "sudo chown openstack:openstack /opt/stack",
      "sudo chmod +x /opt/stack",
      "echo 'openstack ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/stack",
      "cd /opt/stack",
      "git clone https://opendev.org/openstack/devstack",
      "cd devstack",
      "cat > local.conf << EOF\n[[local|localrc]]\nADMIN_PASSWORD=${random_password.openstack_admin_password.result}\nDATABASE_PASSWORD=${random_password.openstack_database_password.result}\nRABBIT_PASSWORD=${random_password.openstack_rabbit_password.result}\nSERVICE_PASSWORD=${random_password.openstack_service_password.result}\nEOF",
      "./stack.sh"
    ]
  }

}

