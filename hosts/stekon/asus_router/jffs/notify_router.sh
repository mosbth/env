#!/bin/sh
domain="stekon.mikaelroos.se"
ip=`wget -qO- ipecho.net/plain`
url="https://mikelroos.se/ddns/$domain/$ip"
#echo $url
cmd=`wget -qO- "$url"`
logger "ddns status: $cmd $ip"
