ansible-playbook prep-master-centos.yml --private-key=~/.ssh/id_rsa -i inventory.ini --limit centosmaster
ansible-playbook prep-node-centos.yml --private-key=~/.ssh/id_rsa -i inventory.ini --limit centosnode
ansible-playbook prep-pass-centos.yml --private-key=~/.ssh/id_rsa -i inventory.ini --limit centos
ansible-playbook prep-master-centos-cleanup.yml --private-key=~/.ssh/id_rsa -i inventory.ini --limit centosmaster
