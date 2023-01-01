FROM debian
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install git rsync genisoimage wget cpio openssh-server -y && apt-get clean -yq
RUN echo 'root:1234' | chpasswd && useradd -s /bin/bash -m r2d2 && echo 'r2d2:1234' | chpasswd
RUN wget https://raw.githubusercontent.com/rdavid000/AUTOINSTALL/main/docker/start.sh -O /root/start.sh && chmod +x /root/start.sh
CMD /root/start.sh ; /bin/bash