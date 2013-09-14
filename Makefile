build:
	sudo docker build -t="kev/docker-uptime" .

run:
	sudo docker run -d kev/docker-uptime
	echo "please, run 'sudo docker port <container-id> 8082' to get port"
