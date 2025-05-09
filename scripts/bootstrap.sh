#!/bin/sh

chmod 0700 /var/lib/tor/hidden_service

FILE=/var/lib/tor/hidden_service/hostname
while [[ ! -f "$FILE" ]]
do 
  sleep 0.3
done

sh -l
