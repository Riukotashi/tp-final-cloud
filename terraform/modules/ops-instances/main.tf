variables "local_path" {
}

resource "openstack_images_image_v2" "ubuntu" {
  name             = "UbuntuOS"
  local_file_path  = var.local_path
  container_format = "bare"
  disk_format      = "qcow2"
  min_disk_gb = 2.5
  min_ram_mb = 1024
}

resource "openstack_networking_network_v2" "network_1" {
  name           = "network_1"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  name       = "subnet_1"
  network_id = openstack_networking_network_v2.network_1.id
  cidr       = "192.168.199.0/24"
  ip_version = 4
}

resource "openstack_compute_secgroup_v2" "secgroup_1" {
  name        = "secgroup_1"
  description = "a security group"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_networking_port_v2" "port_1" {
  name               = "port_1"
  network_id         = openstack_networking_network_v2.network_1.id
  admin_state_up     = "true"
  security_group_ids = [openstack_compute_secgroup_v2.secgroup_1.id]

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_1.id
    ip_address = "192.168.199.10"
  }
}


# Create a web server
resource "openstack_compute_instance_v2" "test-server" {
  name = "toto"
}

resource "openstack_compute_instance_v2" "instance1" {
  name            = "basic"
  image_id        = "ad091b52-742f-469e-8f3c-fd81cadf0743"
  flavor_id       = "3"
  key_pair        = "my_key_pair_name"
  security_groups = [openstack_compute_secgroup_v2.secgroup_1.name]

  metadata = {
    this = "that"
  }

  network {
    name = "my_network"
  }
}

