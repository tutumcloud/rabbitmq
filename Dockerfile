FROM ubuntu:quantal
MAINTAINER Fernando Mayo <fernando@tutum.co>

# Install RabbitMQ
RUN apt-get update
RUN ! DEBIAN_FRONTEND=noninteractive apt-get install -y rabbitmq-server pwgen

# Add scripts
ADD https://raw.github.com/tutumcloud/tutum-docker-rabbitmq/master/run.sh /run.sh
ADD https://raw.github.com/tutumcloud/tutum-docker-rabbitmq/master/set_rabbitmq_password.sh /set_rabbitmq_password.sh
RUN chmod 755 ./*.sh

EXPOSE 5672
CMD ["/run.sh"]