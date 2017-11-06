#!/bin/bash

#  http or https | Protocol of Cloudera Manager Web UI
protocol=http	

#  127.0.0.1	 | hostname or IP Address of Cloudera Manager System		
ipaddress=127.0.0.1		

#  7180 or 7183  | Port No. of Cloudera Manager Web UI
port=7180			

#  admin 	 | Username of admin or user who has service restart rights
username=admin	

#  admin	 | password of admin or user who has service restart rights
password=redhat		

#  Name of Cluster whose services needed to be stopped
clustername=cluster


# Stop the CDH Cluster Services using REST API of Cloudera Manager
/usr/bin/curl -X POST -u "$username:$password" -k -i "$protocol://$ipaddress:$port/api/v1/clusters/$clustername/commands/stop"
