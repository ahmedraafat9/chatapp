FROM php:7.4-apache

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the application code to the container
COPY . /var/www/html/

# Install dependencies
RUN apt-get update && \
    apt-get install -y git unzip libzip-dev && \
    docker-php-ext-install pdo_mysql zip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer install --no-dev

# Expose port 80
EXPOSE 80

# Define the command that will start the Apache web server
CMD ["apache2-foreground"]