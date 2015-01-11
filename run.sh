#!/bin/sh
chown -R anope:anope /opt/services
exec sudo -u anope /opt/services/bin/services --nofork
