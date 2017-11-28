FROM ubuntu
MAINTAINER jimmykarily@gmail.com

RUN apt-get update && apt-get install -y \
    apache2

VOLUME ["/var/sites"]
EXPOSE 80

ADD startup.sh /
RUN chmod +x startup.sh
RUN chmod 777 -R /var/sites

ADD apache2.conf /etc/apache2/apache2.conf
RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf && a2enconf fqdn

CMD /bin/bash -l startup.sh
