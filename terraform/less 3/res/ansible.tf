resource "local_file" "hosts_web" {
  content = templatefile("${path.module}/hosts.tftpl",

    { web =  yandex_compute_instance.web , web2 = yandex_compute_instance.web2 }  )

  filename = "${abspath(path.module)}/hosts.cfg"
}