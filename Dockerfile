# Usamos una imagen base de Nginx
FROM nginx:latest

# Copiamos el archivo principal de HTML al directorio de contenido estático de Nginx
COPY codigo/ /usr/share/nginx/html

# Copiamos el archivo css a la carpeta de css
COPY codigo/style /usr/share/nginx/styles

# Copiamos el archivo de configuración de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Exponemos el puerto 80 para Nginx
EXPOSE 80

# Comando para iniciar Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]
