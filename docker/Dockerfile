FROM debian
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -yq
RUN apt-get install git -yq
RUN apt-get clean -y
RUN useradd -s /bin/bash -m r2d2
RUN echo 'r2d2:4365' | chpasswd
RUN echo 'root:4365' | chpasswd
RUN git clone https://github.com/rdavid000/AUTOINSTALL.git
RUN cd AUTOINSTALL
RUN chmod +x ./setup.sh
CMD ./setup.sh
