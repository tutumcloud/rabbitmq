FROM buildpack-deps:stretch-scm
MAINTAINER nest.yt
#MAINTAINER based on work by Fernando Mayo <fernando@tutum.co>

# Add scripts
ADD run.sh /run.sh
ADD set_rabbitmq_password.sh /set_rabbitmq_password.sh

# Install RabbitMQ
RUN apt-key adv --no-tty --keyserver keyserver.ubuntu.com --recv-keys F7B8CEA6056E8E56 && \
    echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --force-yes rabbitmq-server jq pwgen && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rabbitmq-plugins enable rabbitmq_management && \
    rabbitmq-plugins enable rabbitmq_tracing && \
    echo "ERLANGCOOKIE" > /var/lib/rabbitmq/.erlang.cookie && \
    chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie && \
    chmod 400 /var/lib/rabbitmq/.erlang.cookie && \
    chmod 755 ./*.sh

EXPOSE 5672 15672
CMD ["/run.sh"]
