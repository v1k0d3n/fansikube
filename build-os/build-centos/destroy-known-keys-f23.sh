#!/bin/bash
sed '/<servername>/d' ~/.ssh/known_hosts > ~/.ssh/known_hosts
