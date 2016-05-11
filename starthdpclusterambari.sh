#!/bin/bash

#  http or https | Protocol of Ambari Web UI
protocol=http	

#  127.0.0.1	 | hostname or IP Address of Ambari System		
ipaddress=127.0.0.1		

#  8080 or 8443  | Port No. of Ambari Web UI
port=8080			

#  admin 	 | Username of admin or user who has service restart rights
username=adminusername		

#  admin	 | password of admin or user who has service restart rights
password=adminpassword		

#  Name of Cluster whose services needed to be restart
clustername=hdpclustername	


# Get  the list of HDP Services Installed  and store it in services.list
/usr/bin/curl -u $username:$password -k -s $protocol://$ipaddress:$port/api/v1/clusters/$clustername/services/ | grep service_name | awk  '{print $3}' |  cut -d "\"" -f 2 > services.list

# Create start script "startscript.sh" from the service list "services.list"
xargs -a services.list -i{} echo /usr/bin/curl -u $username:$password -k -i -H \'X-Requested-By: ambari\' -X PUT -d \'{\"RequestInfo\": {\"context\" :\"Start {} via REST\"}, \"Body\": {\"ServiceInfo\": {\"state\": \"STARTED\"}}}\' $protocol://$ipaddress:$port/api/v1/clusters/$clustername/services/{} > startscript.sh

#execute startscript.sh
sh startscript.sh
