#!/bin/bash
docker start ubuntu
docker start centos7
ansible-playbook -i inventory/prod.yml site.yml --ask-vault-password
docker stop ubuntu
docker stop centos7