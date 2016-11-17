# A basic apache server. To use either add or bind mount content under /var/www
FROM ubuntu:16.04

MAINTAINER Steve Mayne version: 0.1

RUN apt-get update && apt-get install -y apache2 php libapache2-mod-php php-mysql php-cli && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

ADD index.php /var/www/index.php

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
