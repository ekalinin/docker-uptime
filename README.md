docker-uptime
==============

A Dockerfile that installs the latest mongodb, nodejs and [uptime](https://github.com/fzaninotto/uptime)

Install
-------

````bash
# get the latests version
$ git clone https://github.com/ekalinin/docker-uptime
$ cd docker-uptime

# build the docker image
$ make build

# run docker's container
$ make run
````

Usage
-----

### List ports

````bash
$ sudo docker ps
ID                  IMAGE                           COMMAND                CREATED             STATUS              PORTS
fb5aa74a5247        kev/docker-uptime:latest        /usr/bin/supervisord   2 days ago          Up 2 days           49162->22, 49163->8082 
````

### Connect via shh

````bash
# see Dockerfile for root's password

$ ssh -p 49162 root@127.0.0.1
root@127.0.0.1's password: 

 root@fb5aa74a5247:~# logout
 Connection to 127.0.0.1 closed.
````

### Check uptime UI

````bash
$ curl -I http://127.0.0.1:49163
HTTP/1.1 302 Moved Temporarily
X-Powered-By: Express
Location: /dashboard/events
Vary: Accept
Content-Type: text/plain
Content-Length: 51
Date: Thu, 18 Sep 2013 19:56:44 GMT
Connection: keep-alive
````
