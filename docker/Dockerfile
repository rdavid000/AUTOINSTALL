FROM debian
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -yq
RUN apt-get install git apache2 php php-curl sudo rsync genisoimage wget cpio net-tools -yq
RUN apt-get clean -y
RUN useradd -s /bin/bash -m r2d2
RUN echo 'r2d2:1234' | chpasswd
RUN echo 'root:1234' | chpasswd
RUN rm -Rf /var/www/html
RUN mkdir /var/www/iso
RUN wget https://raw.githubusercontent.com/rdavid000/AUTOINSTALL/main/www/index.php -O /var/www/index.php
RUN wget https://raw.githubusercontent.com/rdavid000/AUTOINSTALL/main/www/config.sh -O /var/www/config.sh
RUN wget https://raw.githubusercontent.com/rdavid000/AUTOINSTALL/main/www/install.conf -O /var/www/install.conf
RUN wget https://raw.githubusercontent.com/rdavid000/AUTOINSTALL/main/www/generator.sh -O /var/www/generator.sh
RUN wget http://miroir.univ-lorraine.fr/debian-cd/11.6.0/amd64/iso-cd/debian-11.6.0-amd64-netinst.iso -O /var/www/iso/debian-11.6.0-amd64-netinst.iso
RUN wget https://raw.githubusercontent.com/rdavid000/AUTOINSTALL/main/iso/debian-7.0.0-amd64-netinst.cfg -O /var/www/iso/debian-11.6.0-amd64-netinst.cfg

RUN wget https://raw.githubusercontent.com/rdavid000/AUTOINSTALL/main/startup/start.sh -O /root/start.sh
RUN echo 'www-data        ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
RUN chmod 777 /var/www -R
RUN sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf
RUN sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\//' /etc/apache2/sites-enabled/000-default.conf
sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:8080>/' /etc/apache2/sites-enabled/000-default.conf
RUN service sudo restart && service apache2 restart
CMD /root/start.sh ; /bin/bash