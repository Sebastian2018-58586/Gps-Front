# Para la imagen utilizamos una versión ligera de Node v21 como base en el contenedor
FROM node:21-slim

# Instalamos Angular CLI dentro del contenedor para ejecutar los comandos globalmente
RUN npm install -g @angular/cli

# Creamos y configuramos el directorio de trabajo dentro del contenedor
WORKDIR /angular-app

# Copiamos archivos esenciales de configuración e instalación de dependencias
COPY package*.json ./
COPY angular.json ./
COPY tsconfig*.json ./

# Instalar dependencias especificadas para el proyecto dentro del contenedor
RUN npm install

# Copiar el contenido del directorio de trabajo y el código fuente de la aplicación
COPY . .

# Exponer el puerto que escuchará el contenedor para la aplicación en Angular
EXPOSE 4200

# Comando para iniciar la aplicación y hacerlo accesible desde fuera del contenedor
CMD ng serve --host 0.0.0.0 --port 4200