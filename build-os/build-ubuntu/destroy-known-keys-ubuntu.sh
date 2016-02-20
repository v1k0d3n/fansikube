#!/bin/bash
sed '/"$server_name_ubuntu"-/d' ~/.ssh/known_hosts > ~/.ssh/known_hosts
