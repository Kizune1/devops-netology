resource "yandex_compute_instance" "platform1" {
  name        = var.vm_db_name
  platform_id = var.vm_db_platform_id
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    user-data = "${file("./meta.yml")}"
  }
}

variable "vm_db_platform_id" {
  type        = string
  description = "standard-v1"
  default     = "standard-v1"
  }

variable "vm_db_name" {
  type        = string
  description = "default netology-develop-platform-db"
  default     = "netology-develop-platform-db"
  }
  