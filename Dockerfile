FROM ubuntu
MAINTAINER Eugene Kalinin <e.v.kalinin@gmail.com>
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

# node.js
RUN apt-get install python-software-properties python g++ make -y
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install nodejs -y

# mongodb
RUN apt-get install mongodb -y

# uptime
RUN apt-get install git -y
RUN git clone git://github.com/fzaninotto/uptime.git /uptime
RUN cd /uptime; npm install

# private port
EXPOSE 8082
WORKDIR /uptime
CMD ["node", "app.js"]
