###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
  sensitive = true
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default = "b1geukjah0tdrqo9mf2j"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default = "b1g30fajkd135ubk2kni"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}



### vm vars

variable "vm_web_resources" {
  type = map(number)
  default = {
    cores = 4
    memory = 4
    core_fraction = 20
  }
}
variable "vm_db_resources" {
    type = map(number)
    default = {
      cores = 2
      memory = 2
      core_fraction = 20
    }   
}
variable "vm_db_platform_id" {
  type        = string
  description = "standard-v1"
  default     = "standard-v1"
  }
variable "image_ubuntu_2004" {
  type        = string
  description = "default ubuntu-2004-lts"
  default     = "ubuntu-2004-lts"
}