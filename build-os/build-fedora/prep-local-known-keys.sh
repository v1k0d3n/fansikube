#!/bin/bash
ssh-keyscan -t rsa "$server_name_fedora"-master >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name_fedora"-node01 >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name_fedora"-node02 >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name_fedora"-node03 >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name_fedora"-vrouter >> ~/.ssh/known_hosts
