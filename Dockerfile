# Utilizamos una imagen base de PHP 8
FROM php:8.1

# Actualizamos los paquetes e instalamos extensiones de PHP necesarias
RUN apt-get update && \
    apt-get install -y \
        libonig-dev \
        libxml2-dev \
        libzip-dev \
        zip \
        unzip

# Habilitamos extensiones de PHP
RUN docker-php-ext-install pdo_mysql mbstring xml zip

# Instalamos MySQL Server y configuramos un usuario y contraseña
ENV MYSQL_ROOT_PASSWORD=root
RUN apt-get install -y mysql-server

# Copiamos los archivos de la aplicación al directorio de trabajo del contenedor
COPY . /var/www/html

# Exponemos el puerto 80 para acceder al servidor web
EXPOSE 80

# Comando para iniciar el servidor Apache
CMD ["apache2-foreground"]
