#!/bin/bash
sed '/"$server_name_centos"-/d' ~/.ssh/known_hosts > ~/.ssh/known_hosts
