# Usamos una imagen base de PHP con FPM y Nginx
FROM nginx:latest

# Instalamos Nginx y las dependencias necesarias para PHP y MySQLi
RUN apt-get update && apt-get install -y \
    nginx \
    php-mysqli \
    php-cli \
    php-mbstring \
    php-xml \
    php-curl \
    libmariadbclient-dev && apt-get clean

# Copiamos el archivo principal de HTML al directorio de contenido estático de Nginx
COPY codigo/ /usr/share/nginx/html

# Copiamos el archivo css a la carpeta de css
COPY codigo/style /usr/share/nginx/styles

# Copiamos el archivo de configuración de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Exponemos el puerto 80
EXPOSE 80

# Comando para iniciar Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]
