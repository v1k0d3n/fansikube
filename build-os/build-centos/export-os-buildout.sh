#!/bin/bash
#
# SEE README FOR VARIABLE DETAILS
# Make the following changes based on your environment:
keypair_priv=
server_name_centos=
domain_name_centos=
os_build_centos_keypair=
os_build_centos_flavor=
os_build_centos_image=
os_build_centos_nic0=
os_build_centos_nic1=
os_centos_sgroups=
#
#
# DO NOT EDIT BELOW THIS LINE:
export keypair_priv
export server_name_centos
export domain_name_centos
export os_build_centos_keypair
export os_build_centos_flavor
export os_build_centos_image
export os_build_centos_nic0
export os_build_centos_nic1
export os_centos_sgroups
#
echo "Current values set to:"
echo ""
echo "keypair_priv = $keypair_priv"
echo "server_name_centos = $server_name_centos"
echo "domain_name_centos = $domain_name_centos"
echo "os_build_centos_keypair = $os_build_centos_keypair"
echo "os_build_centos_flavor = $os_build_centos_flavor"
echo "os_build_centos_image = $os_build_centos_image"
echo "os_build_centos_nic0 = $os_build_centos_nic0"
echo "os_build_centos_nic1 = $os_build_centos_nic1"
echo "os_centos_sgroups = $os_centos_sgroups"
echo ""
echo "  VERIFY: "
echo "    - To make sure that Ansible can see these variables, run: 'ansible-playbook -i "localhost" -c local print-vars.yml'."
echo ""
echo "  PREPARATIONS: "
echo "    1. Make sure you have openstack cli-tools installed in this deployment host."
echo "    2. Source your openstack-rc.sh file that you've placed into the '../openstack-rc/' folder."
echo "    3. Create rsa_keys and place them into ../rsa_keys with the command: 'ssh-keygen -t rsa -C "$server_name_centos"-master@"$domain_name_centos"'."
echo "    4. Run the following command to build out your infrastructure: './prep-infrastructure-centos.sh'."
echo "    5. Prepare hosts for local resolution and ssh connectivity: "
echo "       - Using the command 'openstack server list', collect IP information, and populate these files appropriately: "
echo "         - Update 'template/hosts.j2' as required."
echo "         - Add 'template/hosts.j2' information to your local /etc/hosts file as required (IP's accessable to the deployment host)."
echo "         - Run ./prep-local-known-keys.sh to populate your ~/.ssh/known_hosts file with your "$server_name_centos"-<host> information."
echo ""
echo "  IMPORTANT: SSH KEYS"
echo "    6. Prepare ssh key declarations: "
echo "      - Using ../../samples/ssh_config.example, add appropriate information to your ~/.ssh/config file."
echo "        - I know this is not idea, and I will fix this later. You only have to do this once."
echo "      - Replace public openstack deployment key into 'template/authorized_keys', along with the public key you created in step 3: "
echo "        - ssh_keypair_01 = Horizon > Project > Compute > Key Pair Name > <key> > Public Key (copy/paste)."
echo "        - ssh_keypair_02 = 'cat rsa_keys/id_rsa.pub'."
echo ""
echo "  BUILD OS INSTANCES: "
echo "    7. Run the following command to prepare your hosts for the kubernetes deployment: './prep-kube-centos.sh'."
echo "    8. Go into the folder for your desired deployment type ('cd ../build-kube/<type>') and follow the README.md."
echo ""
echo "  CONSIDERATIONS: "
echo "    * If you change default for the server_name_centos (i.e. centos|fedora|centos) then change them in inventory.ini as needed."
echo ""
echo " - v1k0d3n"
echo ""
