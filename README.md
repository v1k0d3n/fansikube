### Ansible + IaaS (Openstack) + OS [Centos|Fedora|Ubuntu] + Kubernetes + Opencontrail (or Flannel if you choose)
This repository provides you with working Ansible playbooks and a few ancillary scripts to perform the following:

  * Create Openstack Instances of your choice: CentOS|Fedora|Ubuntu
  * Tools to help manage your PoC (rebuild or destroy without losing IP Address information in Openstack, and without having to recreate inventories, ssh known_hosts entries, or host entries)
  * Working Ansible playbooks to prepare your instances for a Kubernetes deployment inside of Openstack
  * Working Ansible playbooks to prepare and turn up Kubernetes with your choice of SDN's: Contrail|Flannel (with more coming soon, Weave next followed by Calico).
  * Troubleshooting tip and commands to help you understand your environment and get started with this wonderful technology!

Please refer to the "Current State" section near the bottom of this README for information on where things stand currently with this repository. Also, check out the post installation tasks for the various SDN environments, especially if this is new these types of deployments are new to you. I plan on making them very helpful as this repository matures.

The goal is to produce extremely flexible Kubernetes deployments with the least amount of prerequisites. In reality, you can either install the minimal set of prerequisites on your deployment host, or use a Docker container as your deployment host (which you can destroy after your deployment):

**Docker Container Method**
 * `docker run -dit --name <custom_name> quay.io/v1k0d3n/fed-dev /bin/bash`
 * `docker exec -it <container_id> bash`

**Installing Prerequisites**
 * Openstack CLI Tools
 * Ansible

****

####Preparation:
I've recently updated the preparation process for Ubuntu (the reset will be updated shortly), so the preparation is much easier and straightforward!

1. In the `build-os` directory, select which OS you wish to prepare.
2. Edit the top variables section of `export-os-buildout.sh` file.
3. Once complete, run the file within the same directory: `./export-os-buildout.sh`.
4. Follow the instructions for the remainder of the buildout process.

####Cockpit Administration (CentOS|Fedora Only):
CentOS|Fedora users will notice that I have included Cockpit repositories and have enabled Cockpit management for Kubernetes Masters|Nodes. If you haven't played with Cockpit already YOU NEED TO! It's an incredible project that allows you to manage your servers at a node-level (CentOS|Fedora OS), or even at a Kubernetes level. In order to automate this process, I've had to do a couple of extra things:

**Password Prompts**
You will be asked to provide passwords for Root/<OS> users after the completion of `./prep-kube-fedora.sh`. This *does not* enable password level access to your servers. This simply prepares the Cockpit-UI to allow password access.

**SSH Key Generation**
You will be told to generate RSA Keys for your automated build. This is so the keys can be uploaded to the `$server_name-master` node, and then you will need to place the public key into `template/authorized_keys.j2` (so this can be copied to the Kubernetes nodes|minions).

**Cockpit Web-UI Access**
Once `./prep-kube-fedora.sh` has completed updating packages, preparing the OS and Cockpit, and has been prepared for the Kubernetes deployment, you can access Cockpit on the public IP Address of your Kubernetes Master at https://$server_name-master:9090/. You should be able to access it via shortname, since you've been instructed to add these hosts to your local /etc/hosts file, but make sure to allow access to port 9090 in your Openstack Security Groups.

***User:*** fedora|centos (depending on OS)<br>
***Pass:*** password you entered when prompted

Once you have logged into Cockpit, take a look around. You will be able to add all of your servers into the single administration pane by navigating to *Dashboard* > *"+"* (it's blue), and when prompted enter the name or IP address of the server you want to manage. It will be added to your inventory. Once you have install Kubernetes (as described below), you will then be able to manage your entire Kubernetes environment, which includes uploading YAML files for launching containers and services, and scaling containers across the entire cluster. Cockpit is really cool, and not nearly as known as it should be! I hope you really like it! From an operations standpoint, it's really hard to beat!


####Kubernetes Deployment:

1. Choose which deployment you want use: Flannel|Opencontrail, and navigate to the appropriate project folder `build-kube/kube-build-<sdn-project>`
2. Verify that the hostname information matches in build-kube/kube-build-<sdn-project>/inventory.ini and `build-os/build<os>/inventory.ini`
3. Change the values for the following (I may automate this later, in the form of an Ansible survey)

 * `localBuildOutput` (found in build-kube/kube-build-<sdn-project>/inventory.ini) = the full path to the kubernetes. example: /<path-to-repo>/build-kube/kube-build-opencontrail/kubernetes/kubernetes/server/kubernetes/server/bin/)
 * `opencontrail_interface` = typically eth1, as an assumption for this repository
 * `opencontrail_public_subnet` = public, non-routable subnet that kubernetes will talk over (if you don't understand it, make it something you're not using)

4. Run `./setup.sh -i inventory.ini` to start the build process.

####Easy to Rebuild / Easy to Destroy:
If you want to rebuild the machines in openstack, just run:
`build-os/build-<os>/prep-infrastructure-rebuild-<os>.sh script`<br>

If you want to destroy the whole proof of concept environment, run:
`build-os/build-<os>/destroy-all.sh`<br>
`build-os/build-<os>/destroy-known-keys-<os>.sh`

****

####Additional Considerations For Real-World Routing:
These are tasks that I plan on automating soon.

1. Create a network called `oc-<os>-net`

  * Give it a subnet name of oc-<os>-sub
  * Give it a network address (10.88.10.0/24)
  * Set a gateway IP (10.88.10.1)
  * Give it an allocation pool (10.88.10.100,10.88.10.249)
  * Give it working DNS (8.8.8.8,8.8.4.4)
  * Add host routes if needed

2. Next, create a router called oc-<os>-rtr
  * Point to your external network

3. Referring to the steps above ***** CHANGE THIS PLEASE ****** edit the `build-os/template/hosts.j2` template to reflect the addresses on for the network you just created in additional tasks section.

4. After all of the tasks have been created, associate a floating IP address for the <servername>vrouter node.
That's it! Now you should be able to access real services to the floating address!

****

####Post-Installation Verification Tasks:

* Log into your Kubernetes master, and perform a `sudo docker ps`. Result: You should see the Opencontrail containers.
* On your Kubernetes master, perform a `netstat -an | grep 5269 `. You should see each of the containers in an `ESTABLISHED` Listen state. If not, perform the following:
  `sudo docker logs <container-id:opencontrail/control> | grep NoFqnSet`. If you see many `Send FAILED` errors, then restart the container with `sudo docker restart <container-id:opencontrail/control>`
  Perform a `netstat -an | grep 5269` after your container restart, and after a minute or two, your Listen State should change to `ESTABLISHED`. You should have one for each member of the Opencontrail cluster.
* Next, run `kubectl --namespace=kube-system get pods | awk '/kube-dns-v/{ print $2 ;}'`. If you get 4/4, that means that DNS is working correctly, and you're probably good from here on out! If not, or if you're just curious about some other verification tasks...march on soldier!
* Verify that your `kube-system` namespace came up correctly with the command: `kubectl --namespace=kube-system get pods`
* Verify that your `opencontrail` namespace came up correctly with the command: `kubectl --namespace=opencontrail get pods`
* Run the following: `curl http://localhost:8082/global-system-configs | python -mjson.tool`.
* Curl the returned HREF: `curl http://localhost:8082/global-system-config/<unique-id> | python -mjson.tool`.
* Using the returned output, curl the UUID for `global_vrouter_configs` value: `curl http://localhost:8082/global-vrouter-config/<unique-id> | python -mjson.tool`. You should see the following:

        "linklocal_services": {
          "linklocal_service_entry": [
              {
                  "ip_fabric_DNS_service_name": "",
                  "ip_fabric_service_ip": [
                      "<oc-ubuntu-net-ip>"
                  ],
                  "ip_fabric_service_port": <kube_master_api_port>,
                  "linklocal_service_ip": "<kube_service_addresses>",
                  "linklocal_service_name": "kubernetes-ssl",
                  "linklocal_service_port": 443
Pay really close attention to `oc-ubuntu-net-ip`, `kube_master_api_port`, and `kube_service_addresses`.
**NOTE:** `linklocal_service_port` value of 443 was actually overwritten in [`build-kube/kube-build-opencontrail/roles/opencontrail_provision/tasks/master.yml`](https://github.com/Juniper/container-networking-ansible/blob/master/roles/opencontrail_provision/tasks/master.yml#L50). This definition was previously fact gathered, but for this deployment I customized the `kube_master_api_port` definition in `build-kube/kube-build-opencontrail/group_vars/all.yml`. This may be valuable information for you to know!
* Now take a look at your kubernetes running services, using the command `kubectl get svc`.
* More to come soon...(I'm getting tired)

****

####Current State:
Where things stand today in this repository (because I'm only one person, who's refactoring work from other repositories).

**CentOS:**

* CentOS: Openstack Buildout (`build-os/build-centos`) / Working
* CentOS: Preparation (`build-os/build-centos`) / Working
* CentOS: Additional Building Tools (`build-os/build-centos`) / Working
* CentOS: Cockpit Buildout (`kube-build-centos`) / Working
* CentOS: Kubernetes Buildout (`kube-build-centos`) / Working
* CentOS: Flannel Buildout (`kube-build/kube-build-flannel`) / Working (w/Packages, not LocalBuild)
* CentOS: Opencontrail Buildout (`kube-build/kube-build-opencontrail`) / NOT WORKING

*Details: More testing needs to be completed (I was told that this is working from Juniper). Working with Juniper on Opencontrail CentOS Builds.*

**Fedora:**

* Fedora: Openstack Buildout (`build-os/build-Fedora`) / Working
* Fedora: Preparation (`build-os/build-Fedora`) / Working
* Fedora: Additional Building Tools (`build-os/build-Fedora`) / Working
* Fedora: Cockpit Buildout (`kube-build/Fedora`) / Working
* Fedora: Kubernetes Buildout (`kube-build/Fedora`) / Conditionally Working (Flannel builds yes, Opencontrail builds no)
* Fedora: Flannel Buildout (`kube-build/kube-build-flannel`) / Working (w/Packages, not LocalBuild)
* Fedora: Opencontrail Buildout (`kube-build/kube-build-opencontrail`) / NOT WORKING

*Details: Known not to work on Fedora at this time. Part of this is due to DNF, but even with `YUM` installed, the build chokes during building of the kernel modules. I will be working on this during the next week or two.*

**Ubuntu:**

* Ubuntu: Openstack Buildout (`build-os/build-ubuntu`) / Working
* Ubuntu: Preparation (`build-os/build-ubuntu`) / Working
* Ubuntu: Additional Building Tools (`build-os/build-ubuntu`) / Working
* Ubuntu: Cockpit Buildout (`build-os//build-ubuntu `) / N/A
* Ubuntu: Kubernetes Buildout (`kube-build/Ubuntu `) / Working
* Ubuntu: Flannel Buildout (`kube-build/kube-build-flannel`) / Working (w/LocalBuild, not Packages)
* Ubuntu: Opencontrail Buildout (`kube-build/kube-build-opencontrail`) / Working (w/LocalBuild, not Packages)

*Details: Tested and verified to be working on 20160218-1805.*

If you have any issues or want something in particular to work, please drop me a line in issues or send me an email.

****

####Closing Thoughts (Q&A):
**Q.** ***Why not use Ansible to build your cloud IaaS?***<br>
**A.** *It boils down to prerequisites for the deployment host, particularly [shade](http://docs.openstack.org/infra/shade/), which I couldn't find available for OS X (my deployment host preference).*

**Q.** ***Why not use Ansible Tower for your deployment host?***
**A.** *Boy, am I glad you asked this question. I plan to do just that, but I have a lot of learning to do first! This will come, all in due time. You're welcome to help contribute to this effort though, because I think that a Tower deployment would be incredible.*

**Q.** ***Why did you use flaky shell scripts (if you could even call them that)?***<br>
**A.** *A quote comes to mind: "If you are not embarrassed by the first version of your product, you’ve launched too late." - Reid Hoffman <br>
Truth is, this is all very new to me and I don't have a programming background. I'm trying to do the best I can with what I know. Again, I'd welcome anyone who can improve this repository. It would not only help me, but I think it could help a lot of other people too!*

****

####TODO LIST:

* Build correct ansible logic around entire project.
Use variables for the openstack bits in step 3.
* Automate the sourcing of openstack-rc.sh file when launching infrastructure.
* Automate steps 7-9.
* Collect facts from the build (IP addresses) using Ansible facts (see first TODO)
* Automate additional tasks section
