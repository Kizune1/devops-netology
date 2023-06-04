# Домашнее задание к занятию 1. «Введение в Terraform» Повечеровский А.В

### Цель задания

1. Установить и настроить Terrafrom.
2. Научиться использовать готовый код.

------

### Чеклист готовности к домашнему заданию

1. Скачайте и установите актуальную версию **terraform** >=1.4.X . Приложите скриншот вывода команды ```terraform --version```.
```
    vagrant@server1:~/Netology-DevOps/4-terraform$ terraform --version
    Terraform v1.4.6
    on linux_amd64
    + provider registry.terraform.io/yandex-cloud/yandex v0.92.0
```
2. Скачайте на свой ПК данный git репозиторий. Исходный код для выполнения задания расположен в директории **01/src**.
```
    vagrant@server1:~$ git clone git@github.com:Kizune1/ter-homeworks.git
    Cloning into 'ter-homeworks'...
    remote: Enumerating objects: 718, done.
    remote: Counting objects: 100% (267/267), done.
    remote: Compressing objects: 100% (161/161), done.
    remote: Total 718 (delta 151), reused 178 (delta 105), pack-reused 451
    Receiving objects: 100% (718/718), 169.58 KiB | 232.00 KiB/s, done.
    Resolving deltas: 100% (362/362), done.
```
3. Убедитесь, что в вашей ОС установлен docker.
```
    vagrant@server1:~/ter-homeworks$ docker --version
    Docker version 24.0.2, build cb74dfc
    vagrant@server1:~/ter-homeworks$ docker-compose --version
    docker-compose version 1.26.0, build d4451659
```


------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. Установка и настройка Terraform  [ссылка](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart#from-yc-mirror)
2. Зеркало документации Terraform  [ссылка](https://registry.tfpla.net/browse/providers) 
3. Установка docker [ссылка](https://docs.docker.com/engine/install/ubuntu/) 
------

### Задание 1

1. Перейдите в каталог [**src**](https://github.com/netology-code/ter-homeworks/tree/main/01/src). Скачайте все необходимые зависимости, использованные в проекте. 
2. Изучите файл **.gitignore**. В каком terraform файле согласно этому .gitignore допустимо сохранить личную, секретную информацию?
```
    personal.auto.tfvars
```
3. Выполните код проекта. Найдите  в State-файле секретное содержимое созданного ресурса **random_password**, пришлите в качестве ответа конкретный ключ и его значение.
```
    w58wFJP4eIZYVX64
```
4. Раскомментируйте блок кода, примерно расположенный на строчках 29-42 файла **main.tf**.
Выполните команду ```terraform validate```. Объясните в чем заключаются намеренно допущенные ошибки? Исправьте их.
```
    resource "docker_image"  --- Должен содержать имя
    resource "docker_container" "1nginx"  --- Имя должно начинатся с буквы или нижнего подчёркивания.
    name  = "example_${random_password.random_string_fake.resuld}" --- просто ошибки в тексте.
        random_string_fake --- не задекларирован, задекларирован random_string.
        random_password.random_string_fake.resuld --- опечатка в resuld(t).
```
5. Выполните код. В качестве ответа приложите вывод команды ```docker ps```
```
    vagrant@server1:~/Netology-DevOps/4-terraform/terr-less-1/01/src$ sudo docker ps
    CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
    1a822bc9f0b5   f9c14fe76d50   "/docker-entrypoint.…"   8 seconds ago   Up 7 seconds   0.0.0.0:8000->80/tcp   example_w58wFJP4eIZYVX64

```
6. Замените имя docker-контейнера в блоке кода на ```hello_world```, выполните команду ```terraform apply -auto-approve```.
Объясните своими словами, в чем может быть опасность применения ключа  ```-auto-approve``` ? В качестве ответа дополнительно приложите вывод команды ```docker ps```
```
    vagrant@server1:~/Netology-DevOps/4-terraform/terr-less-1/01/src$ sudo docker ps
    CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                  NAMES
    ff9609512263   f9c14fe76d50   "/docker-entrypoint.…"   19 seconds ago   Up 19 seconds   0.0.0.0:8000->80/tcp   hello_world_w58wFJP4eIZYVX64


    Ключ -auto-approve убирает подтверждение при выполнении задекларированных конфигов, что может привести к падению всего, если конфиги были изменены.
    Сначала plan, потом apply!
```
8. Уничтожьте созданные ресурсы с помощью **terraform**. Убедитесь, что все ресурсы удалены. Приложите содержимое файла **terraform.tfstate**.
```
    terraform destroy
    vagrant@server1:~/Netology-DevOps/4-terraform/terr-less-1/01/src$ cat terraform.tfstate
    {
      "version": 4,
      "terraform_version": "1.4.6",
      "serial": 15,
      "lineage": "aacdca0d-ec1c-b669-8a8c-e6dc281ce828",
      "outputs": {},
      "resources": [],
      "check_results": null
    }
```
9. Объясните, почему при этом не был удален docker образ **nginx:latest** ? Ответ подкрепите выдержкой из документации провайдера.


------

## Дополнительные задания (со звездочкой*)

**Настоятельно рекомендуем выполнять все задания под звёздочкой.**   Их выполнение поможет глубже разобраться в материале.   
Задания под звёздочкой дополнительные (необязательные к выполнению) и никак не повлияют на получение вами зачета по этому домашнему заданию. 

### Задание 2*

1. Изучите в документации provider [**Virtualbox**](https://registry.tfpla.net/providers/shekeriev/virtualbox/latest/docs/overview/index) от 
shekeriev.
2. Создайте с его помощью любую виртуальную машину. Чтобы не использовать VPN советуем выбрать любой образ с расположением в github из [**списка**](https://www.vagrantbox.es/)

В качестве ответа приложите plan для создаваемого ресурса и скриншот созданного в VB ресурса. 

------

### Правила приема работы

Домашняя работа оформляется в отдельном GitHub репозитории в файле README.md.   
Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

### Критерии оценки

Зачёт:

* выполнены все задания;
* ответы даны в развёрнутой форме;
* приложены соответствующие скриншоты и файлы проекта;
* в выполненных заданиях нет противоречий и нарушения логики.

На доработку:

* задание выполнено частично или не выполнено вообще;
* в логике выполнения заданий есть противоречия и существенные недостатки. 
