ansible-playbook prep-master-ubuntu.yml --private-key=~/.ssh/id_rsa -i inventory.ini --limit ubuntumaster
ansible-playbook prep-node-ubuntu.yml --private-key=~/.ssh/id_rsa -i inventory.ini --limit ubuntunode
