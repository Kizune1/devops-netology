resource "yandex_compute_instance" "web2" {

    for_each = toset(keys({for i, r in var.vms: i=>r}))

    name = var.vms[each.value]["name"]
    platform_id = var.vms[each.value]["platform_id"]

    resources {

        cores = var.vms[each.value]["cores"]
        memory = var.vms[each.value]["memory"]
        core_fraction = var.vms[each.value]["core_fraction"]

    }
    boot_disk {
        initialize_params {
            image_id = data.yandex_compute_image.ubuntu.image_id
            type = var.vms[each.value]["type"]
            size = var.vms[each.value]["size"]
        }
    }
    
    scheduling_policy { preemptible = true }

    allow_stopping_for_update = true

    network_interface { 
        subnet_id = yandex_vpc_subnet.develop.id
        nat       = true
    }

    depends_on = [ yandex_compute_instance.web ]

    metadata = {
        serial-port-enable = 1
        user-data = "${file("./meta.yml")}"
  }
}