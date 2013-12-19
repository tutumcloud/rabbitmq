#!/bin/bash
if [ ! -f /.rabbitmq_password_set ]; then
	/set_rabbitmq_password.sh
fi
exec /usr/sbin/rabbitmq-server
