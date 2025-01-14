FROM ubuntu

WORKDIR /home/ubuntu

RUN apt-get update 
RUN apt-get install -y openssh-server ssh
#RUN -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

EXPOSE 22

RUN echo 'ubuntu:password' | chpasswd

COPY inventoty.sh .

RUN chmod +x inventoty.sh

CMD ["sh", "inventoty.sh", "&&",  "/usr/sbin/sshd", "-D"]
