#!/bin/bash
nova rebuild server_name-master os_build_ubuntu_image
nova rebuild server_name-node01 os_build_ubuntu_image
nova rebuild server_name-node02 os_build_ubuntu_image
nova rebuild server_name-node03 os_build_ubuntu_image
nova rebuild server_name-vrouter os_build_ubuntu_image
