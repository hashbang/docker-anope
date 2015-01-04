#!/bin/bash

if [ -z "$LINK_HOST" ]; then
  echo "Missing \$LINK_HOST"
  exit 1
fi
if [ -z "$LINK_PORT" ]; then
  echo "Missing \$LINK_PORT"
  exit 1
fi
if [ -z "$LINK_PASSWORD" ]; then
  echo "Missing \$LINK_PASSWORD"
  exit 1
fi
sed -i "s/_LINK_HOST_/$LINK_HOST/" /opt/services/conf/services.conf
sed -i "s/_LINK_PORT_/$LINK_PORT/" /opt/services/conf/services.conf
sed -i "s/_LINK_PASSWORD_/$LINK_PASSWORD/" /opt/services/conf/services.conf

/opt/services/bin/services
