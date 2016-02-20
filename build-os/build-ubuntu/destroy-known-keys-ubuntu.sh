#!/bin/bash
sed '/"$server_name"-/d' ~/.ssh/known_hosts > ~/.ssh/known_hosts
