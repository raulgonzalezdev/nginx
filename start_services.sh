#!/bin/bash

# Verificar si Certbot está instalado y si no, instalarlo
if ! command -v certbot &> /dev/null; then
    echo "Certbot no está instalado. Instalando..."
    sudo apt update
    sudo apt install -y certbot python3-certbot-nginx
else
    echo "Certbot ya está instalado."
fi

# Función para obtener y configurar el certificado SSL si no existe
obtener_certificado() {
    dominio=$1
    if sudo certbot certificates | grep -q "Domains: $dominio"; then
        echo "El certificado para $dominio ya existe."
    else
        echo "Obteniendo y configurando certificado SSL para $dominio..."
        sudo certbot --nginx -d $dominio
    fi
}

# Obtener y configurar certificados SSL
obtener_certificado datqbox.com
obtener_certificado portafolio.datqbox.com
obtener_certificado code.datqbox.com
obtener_certificado blog.datqbox.com

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

