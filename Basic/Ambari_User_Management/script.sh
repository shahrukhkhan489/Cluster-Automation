#!/bin/bash

username='username'
old_password='old_pass'
new_password='new_pass'


# Admin/User Account to change Ambari Passoword. Can be "admin" user also
admin_user=$username
admin_pass=$old_password

# New User
new_user=$username
new_user_pass=$new_password
is_active="True"
is_admin="True" #Give Admin Permissions





ambari_hostnames="ambari_hostname_1
ambari_hostname_2
ambari_hostname_3"



for host in $ambari_hostnames; do 
	echo -e "\n$host";

	# Delete User from Ambari to create new on as below
	# Use this only if old_password is not known. 
	# Be cautious because it deletes the LDAP User too. Requires to execute `ambari-server sync-ldap --users="username"`  to bring LDAP User back
	#curl -k --user "$admin_user":"$admin_pass" -H "X-Requested-By: ambari" -X DELETE "http://$host:8080/api/v1/users/$username" 2> /dev/null
	#curl -k --user "$admin_user":"$admin_pass" -H "X-Requested-By: ambari" -X DELETE "https://$host:8443/api/v1/users/$username" 2> /dev/null


	# Create New User
	# Will fail if Local/LDAP User exists with same usernmae
	curl -k --user "$admin_user":"$admin_pass" -H "X-Requested-By: ambari" -X POST -d '{"Users/user_name":"'$new_user'","Users/password":"'$new_password'","Users/active":"'$is_active'","Users/admin":"'$is_admin'"}' "http://$host:8080/api/v1/users/$username" 2> /dev/null
	curl -k --user "$admin_user":"$admin_pass" -H "X-Requested-By: ambari" -X POST -d '{"Users/user_name":"'$new_user'","Users/password":"'$new_password'","Users/active":"'$is_active'","Users/admin":"'$is_admin'"}' "https://$host:8443/api/v1/users/$username" 2> /dev/null


	# Change Passowrd
	# Will fail if Old_Password is Wrong
	curl -k --user "$admin_user":"$admin_pass" -H "X-Requested-By: ambari" -X PUT -d '{"Users/password":"'$new_password'","Users/old_password":"'$old_password'"}' "http://$host:8080/api/v1/users/$username" 2> /dev/null
	curl -k --user "$admin_user":"$admin_pass" -H "X-Requested-By: ambari" -X PUT -d '{"Users/password":"'$new_password'","Users/old_password":"'$old_password'"}' "https://$host:8443/api/v1/users/$username" 2> /dev/null
done

