terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

resource "yandex_vpc_network" "develop" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "develop" {
  name           = var.subnet_name
  zone           = var.subnet_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [ var.subnet_cidr ]
}