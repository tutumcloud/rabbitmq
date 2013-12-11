tutum-docker-rabbitmq
=====================

Base docker image to run a RabbitMQ server


Usage
-----

To create the image `tutum/rabbitmq`, execute the following command on the tutum-rabbitmq folder:

	sudo docker build -t tutum/rabbitmq .


Running the RabbitMQ server
---------------------------

Run the following command to start rabbitmq:

	ID=$(sudo docker run -d -p 5672 tutum/rabbitmq)


It will store the new container ID (like `d35bf1374e88`) in $ID. Get the allocated external port:

	sudo docker port $ID 5672


It will print the allocated port (like 47283).

Done!
