# stophdpclusterambari
This script is for Stoping all the service in HDP Hadoop Cluster from Ambari WebUI using Command Line REST Scripts using CURL

#Modify the Following variables in sync with Ambari Web UI

protocol=http	              --> http or https | Protocol of Ambari Web UI

ipaddress=127.0.0.1		      --> 127.0.0.1	 | hostname or IP Address of Ambari System	

port=8080	                  --> 8080 or 8443  | Port No. of Ambari Web UI		

username=adminusername      -->	admin 	 | Username of admin or user who has service restart rights	

password=adminpassword      --> admin	 | password of admin or user who has service restart rights		

clustername=hdpclustername	--> Name of Cluster whose services needed to be restart
