FROM ubuntu:16.04
MAINTAINER https://github.com/rmin

RUN apt-get update && apt-get install -y \
	unzip \
    curl \
    git \
    nginx \
    php-curl \
    php-fpm \
	php-mysql \
	php-mcrypt \
	php-json \
	php-xml \
	php-xmlrpc \
	phpunit \
 	&& rm -rf /var/lib/apt/lists/*

# install composer, turn off daemon mode for nginx and php-fpm, set some php vars
# make sure nginx sends errors and access logs into stderr and stdout
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer \
	&& echo "\ndaemon off;" >> /etc/nginx/nginx.conf \
	&& sed -i -e "s/;\?daemonize\s*=\s*yes/daemonize = no/g" /etc/php/7.0/fpm/php-fpm.conf \
	&& sed -i -e 's/;clear_env = no/clear_env = no/' /etc/php/7.0/fpm/pool.d/www.conf \
	&& sed -i -e "s/;\?date.timezone\s*=\s*.*/date.timezone = America\/New_York/g" /etc/php/7.0/cli/php.ini \
	&& ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

# set timezone
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# copy web app into the container
COPY ./application/ /var/www/
COPY ./nginx-default /etc/nginx/sites-available/default

EXPOSE 80
CMD service php7.0-fpm start && nginx