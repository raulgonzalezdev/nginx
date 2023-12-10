#!/bin/bash

# Nombre de la red Docker
NETWORK_NAME="webnet"

docker network create --attachable $NETWORK_NAME


# Iniciar servicios con Docker Compose
echo "Starting services..."
docker-compose up -d
