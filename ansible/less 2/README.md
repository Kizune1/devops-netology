# Install clickhouse and vector ansible playbook

## modules and blocks
    ```
    name - name of module, block, play.
    handlers - triggers befor installation.
    tasks - tasks on remote hosts.
    become - high privelege commands.
    block - if you received an erron on main block, then block rescue will be work.
    
    ansible modules:
        - ansible.builtin.service - interaction with a service.
        - ansible.builtin.get_url - request get from url.
        - ansible.builtin.yum - installation using yum.
        - ansible.builtin.command - entering shell command.

    ```
## Install clickhouse
### Main block "Install clickhouse"
    ```
    - name: Install Clickhouse          # name play
    hosts: clickhouse                   # clickhouse hosts
    handlers:                           # handler block for restart clickhouse-server
      - name: Start clickhouse service  # handler name
        become: true                    # up priveleges
        ansible.builtin.service:        # module service
          name: clickhouse-server       # service name
          state: restarted              # service state
    ```
## Tasks for install
### Get clickhouse distrib
    ```
    tasks:
    - block:                                                                                                                    # start block
        - name: Get clickhouse distrib                                                                                          # task name
          ansible.builtin.get_url:                                                                                              # module get_url
            url: "https://packages.clickhouse.com/rpm/stable/{{ item }}-{{ clickhouse_version }}.noarch.rpm"                    # get package
            dest: "./{{ item }}-{{ clickhouse_version }}.rpm"                                                                   # dest path
          with_items: "{{ clickhouse_packages }}"                                                                               # group vars items
      rescue:                                                                                                                   # if error in block "Get clickhouse distrib" 
        - name: Get clickhouse distrib
          ansible.builtin.get_url:
            url: "https://packages.clickhouse.com/rpm/stable/clickhouse-common-static-{{ clickhouse_version }}.x86_64.rpm"
            dest: "./clickhouse-common-static-{{ clickhouse_version }}.rpm"
    ```

### Install clickhouse
    ```
    - name: Install clickhouse packages
      become: true
      ansible.builtin.yum:
        name:
          - clickhouse-common-static-{{ clickhouse_version }}.rpm
          - clickhouse-client-{{ clickhouse_version }}.rpm
          - clickhouse-server-{{ clickhouse_version }}.rpm
      notify: Start clickhouse service
    - name: Flush handlers
      meta: flush_handlers
    - name: Create database
      ansible.builtin.command: "clickhouse-client -q 'create database logs;'"
      register: create_db
      failed_when: create_db.rc != 0 and create_db.rc !=82
      changed_when: create_db.rc == 0
    ```
### Install Vector
    ```
    - name: Install vector
    hosts: vector
    handlers:
      - name: Start vector service
        become: true
        ansible.builtin.service:
          name: vector
          state: restarted  
    tasks:
      - name: add repo vector
        shell: "curl -1sLf 'https://repositories.timber.io/public/vector/cfg/setup/bash.rpm.sh' | sudo -E bash"
      - name: Install vector
        become: true
        ansible.builtin.yum:
          name:
            - vector
        notify: Start vector service
      - name: Flush handlers
        meta: flush_handlers
    ```