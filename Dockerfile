FROM ubuntu:xenial

ENV DEBIAN_FRONTEND=noninteractive

# Add PPA
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

# Install basics
RUN apt-get update
RUN apt-get install -y curl git

# Install MySQL
RUN apt-get install -y mysql-server

# Install PHP 7.1
RUN apt-get install -y php7.1 php7.1-mysql php7.1-mcrypt php7.1-mbstring php7.1-cli php7.1-gd php7.1-curl php7.1-xml

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir /app
WORKDIR /app

CMD ["./run.sh"]
