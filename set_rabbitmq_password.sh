#!/bin/bash

if [ -f /.rabbitmq_password_set ]; then
	echo "RabbitMQ password already set!"
	exit 0
fi

PASS=$(pwgen -s 12 1)
echo "=> Securing RabbitMQ with a random password"
touch /etc/rabbitmq/rabbitmq-env.conf
echo "default_user=admin" >> /etc/rabbitmq/rabbitmq-env.conf
echo "default_pass=$PASS" >> /etc/rabbitmq/rabbitmq-env.conf

echo "=> Done!"
touch /.rabbitmq_password_set

echo "========================================================================"
echo "You can now connect to this RabbitMQ server using, for example:"
echo ""
echo "    rabbitmqadmin -u admin -p $PASS -H <host> -P <port> list vhosts"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
