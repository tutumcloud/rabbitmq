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

	CONTAINER_ID=$(sudo docker run -d -p 5672 tutum/rabbitmq)

The first time that you run your container, a new random password will be set.
To get the password, check the logs of the container by running:

	sudo docker logs $CONTAINER_ID

You will see an output like the following:

	========================================================================
	You can now connect to this RabbitMQ server using, for example:

	    rabbitmqadmin -u admin -p 5elsT6KtjrqV -H <host> -P <port> list vhosts

	Please remember to change the above password as soon as possible!
	========================================================================

In this case, `5elsT6KtjrqV` is the password set. To get
the allocated port to RabbitMQ, execute:

	sudo docker port $CONTAINER_ID 5672

It will print the allocated port (like 4751). You can then connect to RabbitMQ:

	 rabbitmqadmin -u admin -p 5elsT6KtjrqV -H 127.0.0.1 -P 4751 list vhosts

Done!
