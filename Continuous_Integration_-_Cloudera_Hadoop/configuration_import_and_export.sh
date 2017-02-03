#!/bin/bash

api_version=10



u=admin
p=Centos
h=10.200.99.206

source_username=$u
source_password=$p
source_scm_server_host=$h
source_clusterName=Cluster%201
source_cluster_url=http://$source_scm_server_host:7180/api/v$api_version/clusters/$source_clusterName/services



u=admin
p=admin
h=10.200.99.163

destination_username=$u
destination_password=$p
destination_scm_server_host=$h
destination_clusterName=Cluster%201
destination_cluster_url=http://$destination_scm_server_host:7180/api/v$api_version/clusters/$destination_clusterName/services



servicelist=`curl -u $source_username:$source_password $source_cluster_url | grep "serviceUrl" | awk {'print $3'} | sed "s/\"\(.*\)\",/\1/" | xargs -I {} echo {} | cut -d"/" -f6`



rm -rf service-config; mkdir -p service-config;
for i in `echo $servicelist`; 
do 
	curl -u $source_username:$source_password $source_cluster_url/$i/config > service-config/$i.json; 
done



for i in `echo $servicelist`; 
do 
	curl -H 'Content-Type: application/json' --upload-file service-config/$i.json  -u $destination_username:$destination_password  -X PUT $destination_cluster_url/$i/config;  
	curl -H 'Content-Type: application/json' -X POST  -u $destination_username:$destination_password -d '{}' $destination_cluster_url/$i/commands/deployClientConfig; 
done
rm -rf service-config



for i in `echo $servicelist`; 
do 
	curl  -X POST -u $destination_username:$destination_password $destination_cluster_url/$i/commands/restart; 
done
