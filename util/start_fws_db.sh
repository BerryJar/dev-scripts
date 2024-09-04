#!/bin/bash

if [ -z "$POSTGRESDIR" ]; then
    echo "Error: IDEADIR evironment variable is not set."
    exit 1
fi

cd "$POSTGRESDIR"
sudo systemctl start docker
sudo docker stop gitlab
sudo docker compose up -d
sudo docker inspect postgres-db-1 | grep "IPAddress"
