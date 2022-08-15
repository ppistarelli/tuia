FROM ubuntu

MAINTAINER Pablo Pistarelli

# Se copian todos los archivos del directorio host al directorio del contenedor
COPY ./ /dirTP

# Especificamos cual va a ser el directorio de trabajo (el mismo)
WORKDIR /dirTP

RUN chmod +x *.sh

#Ejecutamos el archivo base del menú principal
ENTRYPOINT ["./menu.sh"]

