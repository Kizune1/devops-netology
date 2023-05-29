# Домашнее задание к занятию 2. «Применение принципов IaaC в работе с виртуальными машинами» Повечеровский А.В


## Задача 1

- Опишите основные преимущества применения на практике IaaC-паттернов.
- Какой из принципов IaaC является основополагающим?


## Решение 1

- Опишите основные преимущества применения на практике IaaC-паттернов:
    1. Быстрота производства и вывода на рынок
    2. Упрощение работы с конфигурациями, централизация конфигураций
    3. Ускорение разработки

- Какой из принципов IaaC является основополагающим?
    CI\CD + CD


## Задача 2

- Чем Ansible выгодно отличается от других систем управление конфигурациями?
- Какой, на ваш взгляд, метод работы систем конфигурации более надёжный — push или pull?


## Решение 2

- Чем Ansible выгодно отличается от других систем управление конфигурациями?
    Работает по модели Push, из-за чего не требует установки агентов на конечных хостах.


- Какой, на ваш взгляд, метод работы систем конфигурации более надёжный — push или pull?
    Push

## Задача 3

Установите на личный компьютер:

- [VirtualBox](https://www.virtualbox.org/),
- [Vagrant](https://github.com/netology-code/devops-materials),
- [Terraform](https://github.com/netology-code/devops-materials/blob/master/README.md),
- Ansible.

*Приложите вывод команд установленных версий каждой из программ, оформленный в Markdown.*


## Решение 2

### 1. Vagrant:
    Installed Version: 2.3.5

    Vagrant was unable to check for the latest version of Vagrant.
    Please check manually at https://www.vagrantup.com

### 2. Terraform:
    Terraform v1.4.6
    on windows_amd64

### 3. Ansible:
    Name: ansible
    Version: 7.5.0
    Summary: Radically simple IT automation
    Home-page: https://ansible.com/
    Author: Ansible, Inc.
    Author-email: info@ansible.com
    License: GPLv3+
    Location: C:\Users\odmin\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.  11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages
    Requires: ansible-core
    Required-by:

## Задача 4 

Воспроизведите практическую часть лекции самостоятельно.

- Создайте виртуальную машину.
- Зайдите внутрь ВМ, убедитесь, что Docker установлен с помощью команды
```
docker ps,
```
Vagrantfile из лекции и код ansible находятся в [папке](https://github.com/netology-code/virt-homeworks/tree/virt-11/05-virt-02-iaac/src).

Примечание. Если Vagrant выдаёт ошибку:
```
URL: ["https://vagrantcloud.com/bento/ubuntu-20.04"]     
Error: The requested URL returned error: 404:
```

выполните следующие действия:

1. Скачайте с [сайта](https://app.vagrantup.com/bento/boxes/ubuntu-20.04) файл-образ "bento/ubuntu-20.04".
2. Добавьте его в список образов Vagrant: "vagrant box add bento/ubuntu-20.04 <путь к файлу>".


## Решение 4

### Вывод команды cat /etc/*release
    DISTRIB_ID=Ubuntu
    DISTRIB_RELEASE=20.04
    DISTRIB_CODENAME=focal
    DISTRIB_DESCRIPTION="Ubuntu 20.04.6 LTS"
    NAME="Ubuntu"
    VERSION="20.04.6 LTS (Focal Fossa)"
    ID=ubuntu
    ID_LIKE=debian
    PRETTY_NAME="Ubuntu 20.04.6 LTS"
    VERSION_ID="20.04"
    HOME_URL="https://www.ubuntu.com/"
    SUPPORT_URL="https://help.ubuntu.com/"
    BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
    PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/    privacy-policy"
    VERSION_CODENAME=focal
    UBUNTU_CODENAME=focal
### Вывод команды docker ps
    CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
