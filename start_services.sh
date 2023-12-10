#!/bin/bash

# Nombre de la red Docker
NETWORK_NAME="webnet"

# Verificar si la red ya existe
if ! docker network ls | grep -q $NETWORK_NAME; then
    echo "Creating attachable Docker network: $NETWORK_NAME"
    # Crear la red Docker como attachable
    docker network create --attachable $NETWORK_NAME
else
    echo "Docker network $NETWORK_NAME already exists"
fi

# Iniciar servicios con Docker Compose
echo "Starting services..."
docker-compose up -d
