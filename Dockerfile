# Utiliza la imagen de Node como base
FROM node:21-slim

# Instalar Angular CLI globalmente
RUN npm install -g @angular/cli

# Crear y configurar el directorio de trabajo
WORKDIR /angular-app

# Copiar archivos de configuración y dependencias
COPY package*.json ./
COPY angular.json ./
COPY tsconfig*.json ./

# Instalar dependencias
RUN npm install

# Copiar el código fuente de la aplicación
COPY . .

# Exponer el puerto de la aplicación
EXPOSE 4200

# Comando para iniciar la aplicación con ng serve y hacerlo accesible desde fuera del contenedor
CMD ng serve --host 0.0.0.0 --port 4200
