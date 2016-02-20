#!/bin/bash
nova rebuild $server_name_fedora-master $os_build_fedora_image
nova rebuild $server_name_fedora-node01 $os_build_fedora_image
nova rebuild $server_name_fedora-node02 $os_build_fedora_image
nova rebuild $server_name_fedora-node03 $os_build_fedora_image
nova rebuild $server_name_fedora-vrouter $os_build_fedora_image
