#!/bin/bash
nova delete "$server_name_centos"-master
nova delete "$server_name_centos"-node01
nova delete "$server_name_centos"-node02
nova delete "$server_name_centos"-node03
nova delete "$server_name_centos"-vrouter
