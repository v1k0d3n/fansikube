#!/bin/bash
nova boot --flavor $os_build_centos_flavor --image $os_build_centos_image --key-name $os_build_centos_keypair \
--security-groups $os_centos_sgroups --nic net-id=$os_build_centos_nic0 --nic net-id=$os_build_centos_nic1 \
$server_name_centos-master

nova boot --flavor $os_build_centos_flavor --image $os_build_centos_image --key-name $os_build_centos_keypair \
--security-groups $os_centos_sgroups --nic net-id=$os_build_centos_nic0 --nic net-id=$os_build_centos_nic1 \
$server_name_centos-node01

nova boot --flavor $os_build_centos_flavor --image $os_build_centos_image --key-name $os_build_centos_keypair \
--security-groups $os_centos_sgroups --nic net-id=$os_build_centos_nic0 --nic net-id=$os_build_centos_nic1 \
$server_name_centos-node02

nova boot --flavor $os_build_centos_flavor --image $os_build_centos_image --key-name $os_build_centos_keypair \
--security-groups $os_centos_sgroups --nic net-id=$os_build_centos_nic0 --nic net-id=$os_build_centos_nic1 \
$server_name_centos-node03

nova boot --flavor $os_build_centos_flavor --image $os_build_centos_image --key-name $os_build_centos_keypair \
--security-groups $os_centos_sgroups --nic net-id=$os_build_centos_nic0 --nic net-id=$os_build_centos_nic1 \
$server_name_centos-vrouter
