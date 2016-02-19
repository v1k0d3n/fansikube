#!/bin/bash
nova boot --flavor os-build-<os>-flavor --image os-build-<os>-image --key-name os-build-<os>-keypair \
--security-groups oc-<os>-kubernetes,oc-<os>-kubernetes-services,oc-<os>-opencontrail --nic net-id=os-build-<os>-nic0 --nic net-id=os-build-<os>-nic1 \
<servername>master

nova boot --flavor os-build-<os>-flavor --image os-build-<os>-image --key-name os-build-<os>-keypair \
--security-groups oc-<os>-kubernetes,oc-<os>-kubernetes-services,oc-<os>-opencontrail --nic net-id=os-build-<os>-nic0 --nic net-id=os-build-<os>-nic1 \
<servername>node01

nova boot --flavor os-build-<os>-flavor --image os-build-<os>-image --key-name os-build-<os>-keypair \
--security-groups oc-<os>-kubernetes,oc-<os>-kubernetes-services,oc-<os>-opencontrail --nic net-id=os-build-<os>-nic0 --nic net-id=os-build-<os>-nic1 \
<servername>node02

nova boot --flavor os-build-<os>-flavor --image os-build-<os>-image --key-name os-build-<os>-keypair \
--security-groups oc-<os>-kubernetes,oc-<os>-kubernetes-services,oc-<os>-opencontrail --nic net-id=os-build-<os>-nic0 --nic net-id=os-build-<os>-nic1 \
<servername>node03

nova boot --flavor os-build-<os>-flavor --image os-build-<os>-image --key-name os-build-<os>-keypair \
--security-groups oc-<os>-kubernetes,oc-<os>-kubernetes-services,oc-<os>-opencontrail --nic net-id=os-build-<os>-nic0 --nic net-id=os-build-<os>-nic1 \
<servername>vrouter
