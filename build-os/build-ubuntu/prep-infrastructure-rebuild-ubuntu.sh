#!/bin/bash
nova rebuild $server_name_ubuntu-master $os_build_ubuntu_image
nova rebuild $server_name_ubuntu-node01 $os_build_ubuntu_image
nova rebuild $server_name_ubuntu-node02 $os_build_ubuntu_image
nova rebuild $server_name_ubuntu-node03 $os_build_ubuntu_image
nova rebuild $server_name_ubuntu-vrouter $os_build_ubuntu_image
