#!/bin/bash
if [ ! -f /.rabbitmq_password_set ]; then
	/set_rabbitmq_password.sh
fi
/usr/sbin/rabbitmq-server
