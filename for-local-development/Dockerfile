# Dockerfile for moodle instance. more dockerish version of https://github.com/jda/docker-moodle
FROM ubuntu:14.04
MAINTAINER Jordi Pujol-Ahulló <jpahullo@gmail.com>

# Default values appear here.
# You can override them using "docker run" option like "-e MOODLE_VERSION=28"
ARG MOODLE_VERSION=30
ARG MOODLE_DATA=/var/www/moodledata

RUN echo "Moodle version:       "${MOODLE_VERSION}
RUN echo "Moodle data directory:"${MOODLE_DATA}

VOLUME ["${MOODLE_DATA}"]
VOLUME ["/var/www/html"]
EXPOSE 80 443

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive
ENV MOODLE_URL $${MOODLE_URL}
ENV MOODLE_VERSION ${MOODLE_VERSION}
ENV MOODLE_DATA ${MOODLE_DATA}

RUN apt-get update && \
    apt-get -y install mysql-client pwgen python-setuptools curl git unzip apache2 php5 \
        php5-gd libapache2-mod-php5 postfix wget supervisor php5-pgsql curl libcurl3 \
        libcurl3-dev php5-curl php5-xmlrpc php5-intl php5-mysql php5-pgsql php5-mssql git-core

# Enable SSL, moodle requires it
# if using proxy, don't need actually secure connection
RUN a2enmod ssl && a2ensite default-ssl 

RUN ln -sf /dev/stdout /var/log/apache2/access.log
RUN ln -sf /dev/stderr /var/log/apache2/error.log
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
