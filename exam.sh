#!/bin/bash

LOG_LOCATION=`cat list.txt |grep '^Malicious_Word'`

for ITEM in $LOG_LOCATION
do
    IP_ADDRESS=$(echo $ITEM | cut -d! -f1)
    echo $IP_ADDRESS
	iptables -A INPUT -s $IP_ADDRESS -p tcp --destination-port 80 -j DROP
	iptables -A INPUT -s $IP_ADDRESS -p tcp --destination-port 443 -j DROP
	
done
