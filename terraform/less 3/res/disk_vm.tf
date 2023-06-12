resource "yandex_compute_disk" "netology-disks" {
  count      = 3
  name       = "netology-disk-${count.index}"
  type       = "network-hdd"
  zone       = "ru-central1-a"
  size       = 1
  block_size = 4096
}

resource "yandex_compute_instance" "storage" {

    name = "storage"
    platform_id = "standard-v1"

    resources {
      cores  = 2
      memory = 1
      core_fraction = 20
    }

    boot_disk {
      initialize_params {
        image_id = data.yandex_compute_image.ubuntu.image_id
        type = "network-hdd"
        size = 5
      }   
    }

    scheduling_policy { preemptible = true }

    allow_stopping_for_update = true

    network_interface { 
        subnet_id = yandex_vpc_subnet.develop.id
        nat       = true
    }
  
}