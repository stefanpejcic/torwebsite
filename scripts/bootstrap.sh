#!/bin/sh

# Permissions on directory /var/lib/tor/hidden_service/ are too permissive
chmod 0700 /var/lib/tor/hidden_service

# Start tor in background
tor &

# Wait for the .onion hostname file to be generated
FILE=/var/lib/tor/hidden_service/hostname
while [ ! -f "$FILE" ]; do
  sleep 0.3
done

# keep it running
tail -f /dev/null
