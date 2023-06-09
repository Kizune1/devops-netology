# Домашнее задание к занятию 3. «Введение. Экосистема. Архитектура. Жизненный цикл Docker-контейнера» Повечеровский А.В



## Задача 1

Сценарий выполнения задачи:

- создайте свой репозиторий на https://hub.docker.com;
- выберите любой образ, который содержит веб-сервер Nginx;
- создайте свой fork образа;
- реализуйте функциональность:
запуск веб-сервера в фоне с индекс-страницей, содержащей HTML-код ниже:
```
<html>
<head>
Hey, Netology
</head>
<body>
<h1>I’m DevOps Engineer!</h1>
</body>
</html>
```

Опубликуйте созданный fork в своём репозитории и предоставьте ответ в виде ссылки на https://hub.docker.com/username_repo.


## Решение 1

### [> Docker Hub mynginx.](https://hub.docker.com/layers/kizune1/)


## Задача 2

Посмотрите на сценарий ниже и ответьте на вопрос:
«Подходит ли в этом сценарии использование Docker-контейнеров или лучше подойдёт виртуальная машина, физическая машина? Может быть, возможны разные варианты?»

Детально опишите и обоснуйте свой выбор.

--

Сценарий:

- высоконагруженное монолитное Java веб-приложение;
- Nodejs веб-приложение;
- мобильное приложение c версиями для Android и iOS;
- шина данных на базе Apache Kafka;
- Elasticsearch-кластер для реализации логирования продуктивного веб-приложения — три ноды elasticsearch, два logstash и две ноды kibana;
- мониторинг-стек на базе Prometheus и Grafana;
- MongoDB как основное хранилище данных для Java-приложения;
- Gitlab-сервер для реализации CI/CD-процессов и приватный (закрытый) Docker Registry.


## Решение 2

- Высоконагруженное монолитное java веб-приложение;
> Физическая машина, чтобы не расходовать ресурсы на виртуализацию и из-за монолитности не будет проблем с разворачиванием на разных машинах.
- Nodejs веб-приложение;
> Docker, для более простого воспроизведения зависимостей в рабочих средах
- Мобильное приложение c версиями для Android и iOS;
> Виртуальные машины, проще для тестирования, размещения на одной хостовой машине
- Шина данных на базе Apache Kafka;
> Docker, есть готовые образы для apache kafka, на руку изолированность приложений, а также легкий откат на стабильные версии в случае обнаружения багов в продакшене
- Elasticsearch кластер для реализации логирования продуктивного веб-приложения - три ноды elasticsearch, два logstash и две ноды kibana;
> Docker, Elasticsearch доступен для установки как образ docker, проще удалять логи, удобнее при кластеризации - меньше времени на запуск контейнеров.
- Мониторинг-стек на базе Prometheus и Grafana;
> Docker. Есть готовые образы, приложения не хранят данные, что удобно при контейниризации, удобно масштабировать и быстро разворачивать.
- MongoDB, как основное хранилище данных для java-приложения;
> Физическая машина как наиболее надежное, отказоустойчивое решение. Либо виртуальный сервер.
- Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry
> Могут быть применены все варианты, в зависимости от наличия соответствующих ресурсов. Но для большей изолированности лучше использовать docker.

## Задача 3

- Запустите первый контейнер из образа ***centos*** c любым тегом в фоновом режиме, подключив папку ```/data``` из текущей рабочей директории на хостовой машине в ```/data``` контейнера.
- Запустите второй контейнер из образа ***debian*** в фоновом режиме, подключив папку ```/data``` из текущей рабочей директории на хостовой машине в ```/data``` контейнера.
- Подключитесь к первому контейнеру с помощью ```docker exec``` и создайте текстовый файл любого содержания в ```/data```.
- Добавьте ещё один файл в папку ```/data``` на хостовой машине.
- Подключитесь во второй контейнер и отобразите листинг и содержание файлов в ```/data``` контейнера.


## Решение 3

### Листинг комманд:
    docker run -v /data:/data --name mycent -d -t centos
    docker run -v /data:/data --name mydeb -d -t debian
    docker exec mycent /bin/bash -c "echo CENTOS>/data/from_centos"
    docker exec mydeb /bin/bash -c "echo DEBIAN>/data/from_debian" (тут добавил еще с дебиана, чтобы нагляднее было)
    echo Host>/data/from_host

### Docker CentOS
    root@server1:/home/vagrant#docker exec mycent /bin/bash -c "ls -la /data"
    total 20
    drwxr-xr-x 2 root root 4096 May 29 20:30 .
    drwxr-xr-x 1 root root 4096 May 29 20:27 ..
    -rw-r--r-- 1 root root    7 May 29 20:28 from_centos
    -rw-r--r-- 1 root root    7 May 29 20:29 from_debian
    -rw-r--r-- 1 root root    5 May 29 20:30 from_host

### Docker Debian
    root@server1:/home/vagrant# docker exec mydeb /bin/bash -c "ls -la /data"
    total 20
    drwxr-xr-x 2 root root 4096 May 29 20:30 .
    drwxr-xr-x 1 root root 4096 May 29 20:27 ..
    -rw-r--r-- 1 root root    7 May 29 20:28 from_centos
    -rw-r--r-- 1 root root    7 May 29 20:29 from_debian
    -rw-r--r-- 1 root root    5 May 29 20:30 from_host


## Задача 4 (*)

Воспроизведите практическую часть лекции самостоятельно.

Соберите Docker-образ с Ansible, загрузите на Docker Hub и пришлите ссылку вместе с остальными ответами к задачам.

## Решение 4
### [> Docker image ansible on Docker Hub](https://hub.docker.com/layers/kizune1/devops-netology/ansible/images/sha256-75013128106dfb59b44e92b8e8bfb788ce65d863a2d81643ebd20f386c9d739d?context=explore)

---

### Как cдавать задание

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---

