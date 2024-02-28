FROM php:8.1-apache

RUN apt-get update

RUN docker-php-ext-install mysqli

RUN apt-get install -y mysql-server

COPY . /var/www/html

# Exponemos el puerto 80 para acceder al servidor web
EXPOSE 80

# Comando para iniciar el servidor Apache
CMD ["apache2-foreground"]