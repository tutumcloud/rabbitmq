#!/bin/bash

if [ -f /.rabbitmq_password_set ]; then
	echo "RabbitMQ password already set!"
	exit 0
fi

USER=${NEST_APP_TAG}
PASS=${NEST_SERVICES_PASSWORD}

_word=$( [ ${RABBITMQ_PASS} ] && echo "preset" )
echo "=> Securing RabbitMQ with a ${_word} password"
cat > /etc/rabbitmq/rabbitmq.config <<EOF
[
	{rabbit, [{default_user, <<"$USER">>},{default_pass, <<"$PASS">>},{tcp_listeners, [{"0.0.0.0", 5672}]}]}
].
EOF

echo "=> Done!"
touch /.rabbitmq_password_set

echo "========================================================================"
echo "You can now connect to this RabbitMQ server using, for example:"
echo ""
echo "    curl --user $USER:<RABBITMQ_PASS> http://<host>:<port>/api/vhosts"
echo ""
echo "========================================================================"
