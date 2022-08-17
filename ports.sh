#!/bin/bash 
date=`date +"%Y/%m/%d %H:%M:%S"`
upnpc -l | grep  "TCP" | grep -q "22"

if [ $? = 0 ]; then
	echo "$date Port is already opened." >>/home/your-name/ports.log
else
	upnpc -a `hostname -I | cut -f1 -d' '` 22 22 tcp
	upnpc -a `hostname -I | cut -f1 -d' '` 80 80 tcp
	upnpc -a `hostname -I | cut -f1 -d' '` 25565 25565 tcp
	upnpc -a `hostname -I | cut -f1 -d' '` 19132 19132 udp
	echo "$date opened" >>/home/your-name/ports.log
fi
