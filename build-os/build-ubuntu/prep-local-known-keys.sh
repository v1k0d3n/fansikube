#!/bin/bash
ssh-keyscan -t rsa "$server_name"-master >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name"-node01 >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name"-node02 >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name"-node03 >> ~/.ssh/known_hosts
ssh-keyscan -t rsa "$server_name"-vrouter >> ~/.ssh/known_hosts
