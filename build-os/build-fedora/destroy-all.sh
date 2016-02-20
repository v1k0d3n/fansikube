#!/bin/bash
nova delete "$server_name_fedora"-master
nova delete "$server_name_fedora"-node01
nova delete "$server_name_fedora"-node02
nova delete "$server_name_fedora"-node03
nova delete "$server_name_fedora"-vrouter
