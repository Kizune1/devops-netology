resource "local_file" "hosts_web" {
  content = templatefile("${path.module}/hosts.tftpl",

    { storage = yandex_compute_instance.storage }  )

  filename = "${abspath(path.module)}/hosts.cfg"
}