# stop-cdhcluster-clouderamanager
This script is for Stoping all the service in CDH Hadoop Cluster from Cloudera Manager WebUI using Command Line REST Scripts using CURL

#Modify the Following variables in sync with Cloudera Manager Web UI

protocol=http	              --> http or https | Protocol of Cloudera Manager Web UI

ipaddress=127.0.0.1		      --> 127.0.0.1	 | hostname or IP Address of Cloudera Manager System	

port=7180	                  --> 7180 or 7183  | Port No. of Cloudera Manager Web UI		

username=adminusername      -->	admin 	 | Username of admin or user who has service restart rights	

password=adminpassword      --> admin	 | password of admin or user who has service restart rights		

clustername=cdhclustername	--> Name of Cluster whose services needed to be stopped
