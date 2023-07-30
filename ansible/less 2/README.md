# Install clickhouse and vector ansible playbook
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