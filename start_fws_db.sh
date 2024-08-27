#!/bin/bash

cd "$POSTGRESDIR"
sudo systemctl start docker
sudo docker stop gitlab
sudo docker compose up -d
sudo docker inspect postgres-db-1 | grep "IPAddress"
