#! /bin/bash

# Username for Accessing ILO Server WebUI
username=ADMIN

# Password for Accessing ILO Server WebUI
passowrd=ADMIN

# IPAddress of ILO Web UI
ipaddress=192.168.1.12


# Login into Supermicro ILO Servers WebUI and Save the Cookie on ~/poweron.cookie
/usr/bin/curl --silent -k -X POST --data "name=$username&pwd=$passowrd&Login=login" $ipaddress/cgi/login.cgi -c ~/poweron.cookie

# Use the Cookie on ~/poweron.cookie and PowerON the Server by Posting (1,1)
/usr/bin/curl --silent -k -X POST --data "POWER_INFO.XML=(1,1)&time_stamp=`date "+%a %b %d %Y %H:%M:%S GMT%z (%Z)"`" $ipaddress/cgi/ipmi.cgi -b ~/poweron.cookie
