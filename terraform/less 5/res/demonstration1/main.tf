terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
backend "s3" {
  endpoint = "storage.yandexcloud.net"
  bucket = "tfstate-backend"
  key = "terraform.tfstate"
  region = "ru-central1"
  
  skip_region_validation = true
  skip_credentials_validation = true

  dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1geukjah0tdrqo9mf2j/etnbpjsno1vhf2ne2qd7"
  dynamodb_table = "tfstate-lock-table"
}

}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}



#создаем облачную сеть
module "yc_network" {
  source = "../yc_network"
}
module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  network_id      = module.yc_network.network_id
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = [ module.yc_network.subnet_id ]
  instance_name   = "web"
  instance_count  = 2
  image_family    = "ubuntu-2004-lts"
  public_ip       = true
  
  metadata = {
      user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
      serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
 template = file("./cloud-init.yml")
}

