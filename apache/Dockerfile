FROM ubuntu
MAINTAINER jimmykarily@gmail.com

RUN apt-get update && apt-get install -y \
    apache2 libapache2-mod-php php-mcrypt php-mysql php-gd php-curl php-zip php-mysql

VOLUME ["/var/sites"]
EXPOSE 80

ADD startup.sh /
RUN chmod +x startup.sh
RUN chmod 777 -R /var/sites

ADD apache2.conf /etc/apache2/apache2.conf
ADD php_apache.conf /etc/apache2/mods-enabled/dir.conf
RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf && a2enconf fqdn

CMD /bin/bash -l startup.sh
