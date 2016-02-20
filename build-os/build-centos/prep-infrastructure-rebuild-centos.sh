#!/bin/bash
nova rebuild $server_name_centos-master $os_build_centos_image
nova rebuild $server_name_centos-node01 $os_build_centos_image
nova rebuild $server_name_centos-node02 $os_build_centos_image
nova rebuild $server_name_centos-node03 $os_build_centos_image
nova rebuild $server_name_centos-vrouter $os_build_centos_image
