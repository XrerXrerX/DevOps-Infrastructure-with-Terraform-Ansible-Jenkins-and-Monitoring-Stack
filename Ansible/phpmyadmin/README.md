<!-- @format -->

# gabungkan dan pishakn task yang memiliki env tertentu

di akses melalui ip tertentu untuk phpmyadmin

usahakan untuk cek security group yang
make sure vars di taruh di tempat yang benar

# karna ip private membaca dns jika aws maka masukkan host nya dns private clone untuk membuat replica user host di master

cek antara master dan clone
mater:
SHOW MASTER STATUS;

clone:
SHOW SLAVE STATUS\G;

#di clone set up jika slave tidak sycn

# database must replica and it will sync but its not it will not sycn . that mus manual configuration

# untuk data yang berjalan must sqldump . or usahakan database bersih dan akan sync di awal

STOP SLAVE;
RESET SLAVE ALL;

CHANGE MASTER TO
MASTER_HOST = '10.0.2.17',
MASTER_USER = 'replica_user',
MASTER_PASSWORD = 'replica_password123',
MASTER_LOG_FILE = 'mysql-bin.000008',
MASTER_LOG_POS = 157;

START SLAVE;

======
jalankan phpmyadmin

ansible-playbook -i inventories/production/all_host.ini playbook/phpmyadmin/deploy/phpmyadmin-only.yaml

ansible-playbook -i inventories/production/all_host.ini playbook/phpmyadmin/deploy/phpmyadmin-only_private.yaml

# Role Name

A brief description of the role goes here.

## Requirements

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

## Role Variables

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

## Dependencies

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

## License

BSD

## Author Information

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
