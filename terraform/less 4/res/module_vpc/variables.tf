variable "network_name" {
  type    = string
  default = "develop"
}

variable "subnet_name" {
  type    = string
  default = "develop-ru-central1-a"
}

variable "subnet_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "subnet_cidr" {
  type    = string
  default = ["10.0.1.0/24"]
}


