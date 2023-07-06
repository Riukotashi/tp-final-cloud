---
title: Provisionnement Infra
---

# Provisionnement Infra

```terraform
# terraform vars que l'on pourrait inclure dans une CI
openstack_external_ip   = "192.168.43.221"
openstack_user_name     = "admin"
openstack_tenant_name   = "admin"
openstack_password      = "secret"
openstack_ssh_user      = "openstack"
openstack_sudo_password = "openstack"
openstack_ssh_key       = "/home/kevin/.ssh/id_rsa"

default_instance_keypair_path = "/home/kevin/.ssh/id_rsa.pub"

instances = {
  web-server = {
    instance_image  = "UbuntuOS"
    init_script = "install-apache.sh"
  },
  database = {
    instance_image  = "UbuntuOS"
    init_script = "install-mysql.sh"
  }
}

volumes = {
    volume_1 = {
      size = 1
    }
    volume_2 = {
      size = 2
    }
  }
```

{% success %}

Dans une infra idéale ce fichier serait mis en secret dans la CI mais dans le context du tp la communication avec GitHub aurait été compliqué à moins de faire nos renneurs en local sur une machine ayant accès au même réseau

{% end %}
