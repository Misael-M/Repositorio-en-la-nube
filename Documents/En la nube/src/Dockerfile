FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade  -y && \
    apt-get install -y apache2 php libapache2-mod-php php-mysql
COPY src/ /q/www/html/
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
