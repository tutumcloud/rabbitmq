tutum-docker-rabbitmq
=====================

Base docker image to run a RabbitMQ server, forked from tutum/rabbitmq (https://github.com/tutumcloud/tutum-docker-rabbitmq) and extended with configurable username.


Usage
-----

To create the image `mminder/rabbitmq`, execute the following command on the tutum-rabbitmq folder:

	sudo docker build -t mminder/rabbitmq .


Running the RabbitMQ server
---------------------------

Run the following command to start rabbitmq:

	docker run -d -p 5672:5672 -p 15672:15672 mminder/rabbitmq

The first time that you run your container, a new random password will be set.
To get the password, check the logs of the container by running:

	docker logs <CONTAINER_ID>

You will see an output like the following:

	========================================================================
	You can now connect to this RabbitMQ server using, for example:

	    rabbitmqadmin -u admin -p 5elsT6KtjrqV -H <host> -P <port> list vhosts

	Please remember to change the above password as soon as possible!
	========================================================================

In this case, `5elsT6KtjrqV` is the password set and 'admin' is the default user.
You can then connect to RabbitMQ:

	rabbitmqadmin -u admin -p 5elsT6KtjrqV -P 15672 list vhosts

Done!


Setting a specific password for the admin account
-------------------------------------------------

If you want to use a preset user and/or password instead of 'admin' and a randomly generated password, you can
set the environment variables `RABBITMQ_USER` and `RABBITMQ_PASS` to your specific username and/or password when running the container:

	docker run -d -p 5672:5672 -p 15672:15672 -e RABBITMQ_PASS="myuser" -e RABBITMQ_PASS="mypass" mminder/rabbitmq

You can now test your new credentials:

	rabbitmqadmin -u myuser -p mypass -P 15672 list vhosts
