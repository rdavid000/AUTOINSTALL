FROM debian
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -yq
RUN apt-get install git apache2 php php-curl sudo rsync genisoimage -yq
RUN apt-get clean -y
echo 'www-data        ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
RUN wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.6.0-amd64-netinst.iso
rm /var/www/index.html
RUN useradd -s /bin/bash -m r2d2
RUN echo 'r2d2:1234' | chpasswd
RUN echo 'root:1234' | chpasswd
RUN git clone https://github.com/rdavid000/AUTOINSTALL.git
RUN mv /AUTOINSTALL/* /var/www/
RUN chmod 777 /var/www -R
RUN cd AUTOINSTALL
RUN service sudo restart
RUN service apache2 restart
CMD /var/www/setup.sh