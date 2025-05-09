#!/bin/sh

# Permissions on directory /var/lib/tor/hidden_service/ are too permissive
chmod 0700 /var/lib/tor/hidden_service

# wait till we generate .onion address
FILE=/var/lib/tor/hidden_service/hostname
while [[ ! -f "$FILE" ]]
do 
  tor
  sleep 0.3
done

# keep it running
tail -f /dev/null
