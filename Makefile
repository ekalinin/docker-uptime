build:
	sudo docker build -t="kev/docker-uptime" .

run:
	ID=$(sudo docker run -d kev/docker-uptime); echo "ext.port: `sudo docker port ${ID} 8082`"
