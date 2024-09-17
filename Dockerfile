# Usar la imagen base de Ubuntu
FROM ubuntu:22.04

# Actualizar paquetes e instalar Apache y PHP
RUN apt-get update && apt-get install -y apache2 php libapache2-mod-php

# Copiar los archivos de la aplicación al directorio web de Apache
COPY . /var/www/html/

# Exponer el puerto 80
EXPOSE 80

# Iniciar Apache en modo foreground
CMD ["apachectl", "-D", "FOREGROUND"]

# Descargar la imagen base de Ubuntu
FROM ubuntu:22.04

# Actualizar la lista de paquetes
RUN apt-get update

# Instalar Apache y PHP
RUN apt-get install -y apache2 php libapache2-mod-php

# Copiar los archivos PHP al directorio de Apache
COPY ./ /var/www/html/

# Establecer el directorio de trabajo
WORKDIR /var/www/html/

# Exponer el puerto 80 para acceder a la aplicación desde el navegador
EXPOSE 80

# Iniciar Apache cuando se ejecute el contenedor
CMD ["apachectl", "-D", "FOREGROUND"]
