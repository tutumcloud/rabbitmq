FROM ubuntu:trusty
MAINTAINER Fernando Mayo <fernando@tutum.co>

# Install RabbitMQ
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F7B8CEA6056E8E56 && \
    echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y rabbitmq-server pwgen && \
    rabbitmq-plugins enable rabbitmq_management && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add scripts
ADD run.sh /run.sh
ADD set_rabbitmq_password.sh /set_rabbitmq_password.sh

EXPOSE 5672 15672
CMD ["/run.sh"]
