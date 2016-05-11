#! /bin/bash

# Username for Accessing ILO Server WebUI
username=ADMIN

# Password for Accessing ILO Server WebUI
passowrd=ADMIN

# IPAddress of ILO Web UI
ipaddress=192.168.1.12


# Login into Supermicro ILO Servers WebUI and Save the Cookie on ~/poweroff.cookie
/usr/bin/curl --silent -k -X POST --data "name=$username&pwd=$passowrd&Login=login" $ipaddress/cgi/login.cgi -c ~/poweroff.cookie

# Use the Cookie on ~/poweroff.cookie and PowerOFF the Server by Posting (1,1)
/usr/bin/curl --silent -k -X POST --data "POWER_INFO.XML=(1,3)&time_stamp=`date "+%a %b %d %Y %H:%M:%S GMT%z (%Z)"`" $ipaddress/cgi/ipmi.cgi -b ~/poweroff.cookie
