terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
#backend "s3" {
#  endpoint = "storage.yandexcloud.net"
#  bucket = "tfstate-backend"
#  key = "terraform.tfstate"
#  region = "ru-central1"
#  
#  skip_region_validation = true
#  skip_credentials_validation = true
#
#  dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1geukjah0tdrqo9mf2j/etnbpjsno1vhf2ne2qd7"
#  dynamodb_table = "tfstate-lock-table"
#}

}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}


