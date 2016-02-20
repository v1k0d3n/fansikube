#!/bin/bash
sed '/"$server_name_fedora"-/d' ~/.ssh/known_hosts > ~/.ssh/known_hosts
