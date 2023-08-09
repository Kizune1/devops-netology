```
########################################### Установка Nginx ############################################################################
        - name: Install nginx
          hosts: lighthouse
          handlers:
            - name: start-nginx
              become: true
              command: systemctl start nginx
            - name: reload-nginx
              become: true
              command: systemctl reload nginx
          tasks:
            - name: NGINX | Install epel-release
              become: true
              ansible.builtin.yum:
                name: epel-release
                state: present
            - name: NGINX | Install nginx
              become: true
              ansible.builtin.yum:
                name: nginx
                state: present
              notify: start-nginx
########################################### Установка Lighthouse ############################################################################              
        - name: Install lighthouse
          hosts: lighthouse
          handlers:
            - name: reload-nginx
              become: true
              command: systemctl reload nginx
########################################### Установка git ############################################################################               
          pre_tasks:
            - name: Lighthouse | Install dependencies
              become: true
              ansible.builtin.yum:
                name: git
                state: present
          tasks:
########################################### Клонирование репозитория с Lighthouse ############################################################################    
            - name: Lighthouse | Copy from git
              become: true
              git:
                repo: "{{ lighthouse_vcs }}"
                version: master
                dest: "{{ lighthouse_dir }}"
########################################### Создание конфига из шаблона и добавление в conf.d nginx ###########################################################    
            - name: Lighthouse | Create lighthouse config
              become: true
              template:
                src: templates/lighthouse.conf.j2
                dest: /etc/nginx/conf.d/defaul.cfg
                mode: 0644
              notify: reload-nginx
```