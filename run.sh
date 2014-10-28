#!/bin/bash
if [ ! -f /.rabbitmq_password_set ]; then
	/set_rabbitmq_password.sh
fi

# make rabbit own its own files
chown -R rabbitmq:rabbitmq /var/lib/rabbitmq

exec /usr/sbin/rabbitmq-server
