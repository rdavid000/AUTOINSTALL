FROM debian
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install git rsync genisoimage wget cpio openssh-server -y
RUN apt-get clean -yq
RUN echo 'root:1234' | chpasswd
RUN wget https://raw.githubusercontent.com/rdavid000/AUTOINSTALL/main/docker/start.sh -O /root/start.sh
CMD /root/start.sh ; /bin/bash