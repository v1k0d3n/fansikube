#!/bin/bash
ssh-keyscan -t rsa "$server_name_ubuntu"-master >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name_ubuntu"-node01 >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name_ubuntu"-node02 >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name_ubuntu"-node03 >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name_ubuntu"-vrouter >> ~/.ssh/known_hosts
