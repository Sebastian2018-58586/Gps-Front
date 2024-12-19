# Etapa 1: Construcción
FROM node:18 AS builder

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar los archivos de dependencias e instalarlas
COPY package*.json ./
RUN npm install

# Copiar el código fuente y compilar la aplicación Angular
COPY . .
RUN npm run build --prod

# Etapa 2: Servir con Nginx
FROM nginx:alpine

# Copiar el build de Angular desde la etapa anterior al directorio de Nginx
COPY --from=builder /app/dist/app-frontend /usr/share/nginx/html

# Configuración de Nginx personalizada (opcional)
# Puedes agregar un archivo nginx.conf si necesitas configuraciones específicas
COPY nginx.conf /etc/nginx/nginx.conf

# Exponer el puerto
EXPOSE 4200

# Comando para iniciar Nginx (ya está en la imagen base, no necesitas cambiarlo)
CMD ["nginx", "-g", "daemon off;"]
