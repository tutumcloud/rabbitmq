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

	docker run -d -p 5672:5672 -p 15672:15672 tutum/rabbitmq

The first time that you run your container, a new random password will be set.
To get the password, check the logs of the container by running:

	docker logs <CONTAINER_ID>

You will see an output like the following:

	========================================================================
	You can now connect to this RabbitMQ server using, for example:

            curl --user admin:5elsT6KtjrqV  http://<host>:<port>/api/vhosts

	Please remember to change the above password as soon as possible!
	========================================================================

In this case, `5elsT6KtjrqV` is the password set. 
You can then connect to RabbitMQ:

        curl --user admin:5elsT6KtjrqV  http://<host>:<port>/api/vhosts

Done!


Setting a specific password for the admin account
-------------------------------------------------

If you want to use a preset password instead of a randomly generated one, you can
set the environment variable `RABBITMQ_PASS` to your specific password when running the container:

	docker run -d -p 5672:5672 -p 15672:15672 -e RABBITMQ_PASS="mypass" tutum/rabbitmq

You can now test your new admin password:

        curl --user admin:mypass  http://<host>:<port>/api/vhosts


Running a RabbitMQ cluster
--------------------------

To run a cluster with all the DNS-Reachable Host, you have to set `RABBITMQ_USE_LONGNAME`
and `HOSTNAME` on first server :

```
docker run -d \
 -p 5672:5672 -p 15672:15672 -p 35197:35197 -p 4369:4369 -p 25672:25672 \
 -e HOSTNAME=node1.host.io \
 -e RABBITMQ_USE_LONGNAME=true \
 tutum/rabbitmq
```

And add `CLUSTER_WITH` for the others nodes :

```
docker run -d \
 -p 5672:5672 -p 15672:15672 -p 35197:35197 -p 4369:4369 -p 25672:25672 \
 -e HOSTNAME=node2.host.io \
 -e RABBITMQ_USE_LONGNAME=true \
 -e CLUSTER_WITH=node1.host.io \
 tutum/rabbitmq
```
RabbitMQ cluster stack file with Tutum
------------------------------------

```
rabbitmq-master:
  image: tutum/rabbitmq
rabbitmq-slave:
  image: tutum/rabbitmq
  environment:
    - CLUSTER_WITH=rabbitmq-master-1
  links:
    - rabbitmq-master
```
