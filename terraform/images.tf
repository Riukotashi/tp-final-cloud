resource "openstack_images_image_v2" "ubuntu" {
  name             = "UbuntuOS"
  container_format = "bare"
  image_source_url = "https://cloud-images.ubuntu.com/jammy/20230602/jammy-server-cloudimg-amd64.img"
  disk_format      = "qcow2"
  min_disk_gb      = 3
  min_ram_mb       = 1024
}