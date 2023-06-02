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

###

### Вывод консоли
    Bringing machine 'server1.netology' up with 'virtualbox' provider...
    ==> server1.netology: Importing base box 'bento/ubuntu-20.04'...
    ==> server1.netology: Matching MAC address for NAT networking...
    ==> server1.netology: Setting the name of the VM: server1.netology
    ==> server1.netology: Clearing any previously set network interfaces...
    ==> server1.netology: Preparing network interfaces based on configuration...
        server1.netology: Adapter 1: nat
        server1.netology: Adapter 2: hostonly
    ==> server1.netology: Forwarding ports...
        server1.netology: 22 (guest) => 20011 (host) (adapter 1)
        server1.netology: 22 (guest) => 2222 (host) (adapter 1)
        server1.netology: 22 (guest) => 2222 (host) (adapter 1)
    ==> server1.netology: Running 'pre-boot' VM customizations...
    ==> server1.netology: Booting VM...
    ==> server1.netology: Waiting for machine to boot. This may take a few minutes...
        server1.netology: SSH address: 172.29.208.1:2222
        server1.netology: SSH username: vagrant
        server1.netology: SSH auth method: private key
        server1.netology: Warning: Connection reset. Retrying...
        server1.netology:
        server1.netology: Vagrant insecure key detected. Vagrant will automatically replace
        server1.netology: this with a newly generated keypair for better security.
        server1.netology:
        server1.netology: Inserting generated public key within guest...
        server1.netology: Removing insecure key from the guest if it's present...
        server1.netology: Key inserted! Disconnecting and reconnecting using new SSH key...
    ==> server1.netology: Machine booted and ready!
    ==> server1.netology: Checking for guest additions in VM...
    ==> server1.netology: Setting hostname...
    ==> server1.netology: Configuring and enabling network interfaces...
    ==> server1.netology: Mounting shared folders...
        server1.netology: /vagrant => /mnt/c/Users/aluka/ansible
    ==> server1.netology: Running provisioner: ansible...
    Vagrant gathered an unknown Ansible version:


    and falls back on the compatibility mode '1.8'.

    Alternatively, the compatibility mode can be specified in your Vagrantfile:
    https://www.vagrantup.com/docs/provisioning/ansible_common.html#compatibility_mode

    server1.netology: Running ansible-playbook...
    [WARNING]: Ansible is being run in a world writable directory
    (/mnt/c/Users/aluka/ansible), ignoring it as an ansible.cfg source. For more
    information see
    https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-
    world-writable-dir

    PLAY [Playbook] ****************************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [server1.netology]

    TASK [Installing tools] ********************************************************
    ok: [server1.netology] => (item=git)
    ok: [server1.netology] => (item=curl)

    TASK [Installing docker] *******************************************************
    changed: [server1.netology]

    TASK [Add the current user to docker group] ************************************
    changed: [server1.netology]

    PLAY RECAP *********************************************************************
    server1.netology           : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

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
### Вывод команды docker -v

    Docker version 24.0.2, build cb74dfc

### Вывод команды docker ps

    CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAME
    