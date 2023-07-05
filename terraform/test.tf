resource "openstack_blockstorage_volume_v3" "volume_1" {
  name        = "volume_1"
  description = "first test volume"
  size        = 3
}

resource "openstack_compute_flavor_v2" "cloud-tiny" {
  name  = "cloud-tiny"
  ram   = "1024"
  vcpus = "1"
  disk  = "20"
}

resource "openstack_compute_keypair_v2" "main-keypair" {
  name       = "main-keypair"
  public_key = file("/home/kevin/.ssh/id_rsa.pub")
}


resource "openstack_networking_router_v2" "router_1" {
  name                = "router_1"
  external_network_id = data.openstack_networking_network_v2.public_network.id
}

data "openstack_networking_network_v2" "public_network" {
  name = "public"
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
    from_port   = 33
    to_port     = 33
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