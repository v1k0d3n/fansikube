#!/bin/bash
nova boot --flavor os_build_ubuntu_flavor --image os_build_ubuntu_image --key-name os_build_ubuntu_keypair \
--security-groups os_ubuntu_sgroups --nic net-id=os-build-ubuntu-nic0 --nic net-id=os-build-ubuntu-nic1 \
server_name-master

nova boot --flavor os_build_ubuntu_flavor --image os_build_ubuntu_image --key-name os_build_ubuntu_keypair \
--security-groups os_ubuntu_sgroups --nic net-id=os-build-ubuntu-nic0 --nic net-id=os-build-ubuntu-nic1 \
server_name-node01

nova boot --flavor os_build_ubuntu_flavor --image os_build_ubuntu_image --key-name os_build_ubuntu_keypair \
--security-groups os_ubuntu_sgroups --nic net-id=os-build-ubuntu-nic0 --nic net-id=os-build-ubuntu-nic1 \
server_name-node02

nova boot --flavor os_build_ubuntu_flavor --image os_build_ubuntu_image --key-name os_build_ubuntu_keypair \
--security-groups os_ubuntu_sgroups --nic net-id=os-build-ubuntu-nic0 --nic net-id=os-build-ubuntu-nic1 \
server_name-node03

nova boot --flavor os_build_ubuntu_flavor --image os_build_ubuntu_image --key-name os_build_ubuntu_keypair \
--security-groups os_ubuntu_sgroups --nic net-id=os-build-ubuntu-nic0 --nic net-id=os-build-ubuntu-nic1 \
server_name-vrouter
