FROM ubuntu:quantal
MAINTAINER Fernando Mayo <fernando@tutum.co>

RUN apt-get update
RUN ! DEBIAN_FRONTEND=noninteractive apt-get install -y rabbitmq-server

EXPOSE 5672
CMD ["/usr/sbin/rabbitmq-server"]