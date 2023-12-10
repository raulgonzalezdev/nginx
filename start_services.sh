#!/bin/bash

# Nombre de la red Docker
NETWORK_NAME="webnet"

# Verificar si la red ya existe y si no, crearla
if ! docker network ls | grep -q $NETWORK_NAME; then
    echo "Creando la red Docker: $NETWORK_NAME..."
    docker network create --attachable $NETWORK_NAME
else
    echo "La red Docker '$NETWORK_NAME' ya existe."
fi

# Iniciar servicios con Docker Compose
echo "Iniciando servicios..."
docker-compose up -d

# Opcional: Instrucciones para renovar los certificados SSL
# Puedes agregar un cron job o un script para renovar los certificados

docker-compose up -d

