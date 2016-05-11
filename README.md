# starthdpclusterambari
This script is for Starting all the service in HDP Hadoop Cluster from Ambari WebUI using Command Line REST Scripts using CURL

Modify the Following variables in sync with Ambari Web UI

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
