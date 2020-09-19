#!/bin/sh
user="mikaelroos.se"
password=""
domain="stekon.mikaelroos.se"
ip=`wget -qO- ipecho.net/plain`
url="https://dyndns.loopia.se?hostname=$domain&myip=$ip"
echo $url
cmd=`wget -qO- --user=$user --password="$password" "$url"`
logger "ddns status: $cmd $ip"
