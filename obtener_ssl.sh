#!/bin/bash

# Lista de dominios para los que se generará el certificado SSL
DOMINIOS=(
    "datqbox.com"
    "www.datqbox.com"
    "portafolio.datqbox.com"
    "code.datqbox.com"
    "blog.datqbox.com"
    "pos.datqbox.com"
    "app.datqbox.com"
    "crm.datqbox.com"
)

# Detener nginx-proxy
echo "Deteniendo nginx-proxy..."
docker-compose down nginx-proxy

# Activar nginx local
echo "Activando nginx local..."
sudo systemctl start nginx

# Función para intentar obtener certificados automáticos
obtener_certificados() {
    for dominio in "${DOMINIOS[@]}"; do
        echo "Intentando obtener certificado para $dominio..."
        if sudo certbot --nginx -d "$dominio"; then
            echo "Certificado obtenido para $dominio."
        else
            echo "Falló la obtención automática de certificado para $dominio, intentando método manual..."
            sudo certbot certonly --manual --preferred-challenges dns -d "$dominio"
            echo "Realiza los cambios DNS requeridos y presiona Enter para continuar..."
            read -r
            echo "Verificando el registro DNS..."
            dig -t TXT "_acme-challenge.$dominio"
        fi
    done
}

# Obtener certificados SSL
obtener_certificados

# Apagar nginx local
echo "Apagando nginx local..."
sudo systemctl stop nginx

# Volver a levantar nginx con los contenedores
echo "Iniciando nginx con contenedores..."
docker-compose up -d
