#!/bin/bash
nova boot --flavor $os_build_fedora_flavor --image $os_build_fedora_image --key-name $os_build_fedora_keypair \
--security-groups $os_fedora_sgroups --nic net-id=$os_build_fedora_nic0 --nic net-id=$os_build_fedora_nic1 \
$server_name_fedora-master

nova boot --flavor $os_build_fedora_flavor --image $os_build_fedora_image --key-name $os_build_fedora_keypair \
--security-groups $os_fedora_sgroups --nic net-id=$os_build_fedora_nic0 --nic net-id=$os_build_fedora_nic1 \
$server_name_fedora-node01

nova boot --flavor $os_build_fedora_flavor --image $os_build_fedora_image --key-name $os_build_fedora_keypair \
--security-groups $os_fedora_sgroups --nic net-id=$os_build_fedora_nic0 --nic net-id=$os_build_fedora_nic1 \
$server_name_fedora-node02

nova boot --flavor $os_build_fedora_flavor --image $os_build_fedora_image --key-name $os_build_fedora_keypair \
--security-groups $os_fedora_sgroups --nic net-id=$os_build_fedora_nic0 --nic net-id=$os_build_fedora_nic1 \
$server_name_fedora-node03

nova boot --flavor $os_build_fedora_flavor --image $os_build_fedora_image --key-name $os_build_fedora_keypair \
--security-groups $os_fedora_sgroups --nic net-id=$os_build_fedora_nic0 --nic net-id=$os_build_fedora_nic1 \
$server_name_fedora-vrouter
