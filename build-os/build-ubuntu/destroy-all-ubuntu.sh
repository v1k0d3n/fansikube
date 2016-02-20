#!/bin/bash
nova delete "$server_name_ubuntu"-master
nova delete "$server_name_ubuntu"-node01
nova delete "$server_name_ubuntu"-node02
nova delete "$server_name_ubuntu"-node03
nova delete "$server_name_ubuntu"-vrouter
