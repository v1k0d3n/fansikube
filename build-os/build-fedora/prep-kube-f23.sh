ansible-playbook prep-master-f23.yml --private-key=~/.ssh/id_rsa -i inventory.ini --limit fedoramaster
ansible-playbook prep-node-f23.yml --private-key=~/.ssh/id_rsa -i inventory.ini --limit fedoranode
ansible-playbook prep-pass-f23.yml --private-key=~/.ssh/id_rsa -i inventory.ini --limit fedora
ansible-playbook prep-fedora-cleanup.yml --private-key=~/.ssh/id_rsa -i inventory.ini --limit fedora
