FROM node:lts-bullseye as build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

### Stage 2
FROM nginx:alpine
ADD ./config/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist/app-frontend /var/www/app/app-frontend/app-frontend/
EXPOSE 4200
CMD ["nginx", "-g", "daemon off;"]



# COPY . .
#RUN npm install
#RUN npm run build --prod

# Usa una imagen de servidor web para servir la aplicación Angular
#FROM nginx:alpine
#COPY --from=build /app/dist/your-angular-project /usr/share/nginx/html
#EXPOSE 4200