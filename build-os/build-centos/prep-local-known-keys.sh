#!/bin/bash
ssh-keyscan -t rsa "$server_name_centos"-master >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name_centos"-node01 >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name_centos"-node02 >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name_centos"-node03 >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name_centos"-vrouter >> ~/.ssh/known_hosts
