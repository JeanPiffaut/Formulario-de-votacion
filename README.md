# Formulario de votación

## Instalar el ambiente de desarrollo

La instalación se hace en línea de comandos ubicada en la carpeta rais del proyecto:

```zsh
docker-compose up -d
```

## Comandos disponibles

Una vez instalado, se pueden utilizar los siguientes comandos:

```zsh
docker-compose start    # Iniciar el ambiente de desarrollo
docker-compose stop     # Detener el ambiente de desarrollo
docker-compose down     # Detener y eliminar el ambiente de desarrollo.
```

## Estructura de Archivos

* `/docker` contiene los archivos de configuración de Docker.
* `/src` carpeta para los archivos PHP del proyecto.

## Accesos

### Web
Se seleccionó el puerto 81, con el fin de que no se tope con los puertos usualmente usados localmente.
* http://localhost:81/

Este se puede modificar en el archivo `.env`