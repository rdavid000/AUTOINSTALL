FROM debian
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -yq
RUN apt-get install git apache2 php php-curl sudo rsync genisoimage wget -yq
RUN apt-get clean -y
RUN useradd -s /bin/bash -m r2d2
RUN echo 'r2d2:1234' | chpasswd
RUN echo 'root:1234' | chpasswd
RUN rm /var/www/index.html
RUN wget https://raw.githubusercontent.com/rdavid000/AUTOINSTALL/main/www/index.php -O /AUTOINSTALL/www/index.php
RUN wget https://raw.githubusercontent.com/rdavid000/AUTOINSTALL/main/startup/start.sh -O /AUTOINSTALL/www/start.sh
RUN echo 'www-data        ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
RUN service sudo restart && service apache2 restart
RUN chmod 777 /var/www -R
RUN service sudo restart && service apache2 restart
CMD /AUTOINSTALL/start.sh