FROM debian

RUN apt update
RUN apt install -y openssh-server openssh-client
RUN apt install -y git
RUN apt install -y docker docker-compose ansible
RUN apt install -y bash
RUN apt install -y openjdk-17-jdk
RUN apt install -y maven

RUN echo -n 'root:1234' | chpasswd
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN ssh-keygen -A

EXPOSE 22

ENTRYPOINT service ssh restart & bash