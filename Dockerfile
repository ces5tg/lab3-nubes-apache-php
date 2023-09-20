# Usa una imagen base de Ubuntu
FROM ubuntu:20.04

# Actualiza el sistema e instala Apache2 y PHP7
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 php7.4 libapache2-mod-php7.4 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copia los archivos del sitio web a la carpeta /var/www/html
COPY ./html2 /var/www/html

# Exponer el puerto 80 para Apache
EXPOSE 80

# Iniciar Apache en primer plano
CMD ["apachectl", "-D", "FOREGROUND"]