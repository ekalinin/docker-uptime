# Dockerfile for upstart
# https://github.com/fzaninotto/uptime
#
# VERSION 0.1.0

FROM ubuntu
MAINTAINER Eugene Kalinin <e.v.kalinin@gmail.com>

# latest mongodb
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
RUN echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" > /etc/apt/sources.list.d/10gen.list

# refresh
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# node.js
RUN apt-get install -y python-software-properties python g++ make
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y rlwrap nodejs

# locales (for mongodb)
RUN locale-gen en_US en_US.UTF-8

# mongodb
RUN mkdir -p /data/db
RUN apt-get install -y mongodb

# supervisord
RUN mkdir -p /var/log/supervisor
RUN apt-get install -y supervisor

# ssh
RUN mkdir -p /var/run/sshd
RUN apt-get install -y openssh-server
RUN /bin/sh -c 'echo root:upstart | chpasswd'

# uptime
RUN apt-get install -y git
RUN git clone git://github.com/fzaninotto/uptime.git /uptime
RUN cd /uptime; npm install
ADD upstart.conf.yaml /uptime/config/default.yaml

# config for auto start ssh/mongod
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# ports
EXPOSE 22 8082

# start all
CMD ["/usr/bin/supervisord", "-n"]
