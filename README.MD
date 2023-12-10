
# NGINX Proxy Automation 🔥

<p align="center">
   <a target="_blank" href="https://docs.docker.com/"><img src="https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white" /></a>
   <a target="_blank" href="https://docs.nginx.com/"><img src="https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white" /></a>
   <a target="_blank" href="https://developer.wordpress.org/"><img src="https://img.shields.io/badge/Wordpress-21759B?style=for-the-badge&logo=wordpress&logoColor=white" /></a>
</p>
<p align="center">
   <a target="_blank" href="https://letsencrypt.org/docs/"><img src="https://img.shields.io/badge/Secured_by-Let's_Encrypt-blue.svg?logo=let%E2%80%99s-encrypt" /></a>
</p>

<p align="center">
   <img src="https://github.com/evertramos/images/raw/master/webproxy.jpg" />
</p>

## How to start 🔰
[![shell script](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://github.com/raulgonzalezdev)


1. Clone this repository using the option **_--recurse-submodules_** ⚠️

```bash
git clone https://github.com/raulgonzalezdev/nginx.git proxy 
```

We use submodule for [basescript](https://github.com/evertramos/basescript)

2. 🚀 Run the script 'start_services.sh' from the _./proxy

  Dar Permiso de Ejecución al Script:

  Otorga permisos de ejecución al script start_services.sh. Si necesitas privilegios elevados, utiliza sudo:

```bash
   chmod +x start_services.sh
  # O, si necesitas sudo
   sudo chmod +x start_services.sh
```

  Ejecutar el Script:
  Ejecuta el script para iniciar los servicios. Si necesitas privilegios elevados, utiliza 

```bash
    ./start_services.sh --yes
   # O, si necesitas sudo
  sudo ./start_services.sh --yes

```


