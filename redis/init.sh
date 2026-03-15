#!/bin/sh

echo "[init-redis] Resolving environment variables in users.acl file..."

sed \
  -e "s|{{REDIS_ROOT_PASSWORD}}|$REDIS_ROOT_PASSWORD|g" \
  -e "s|{{REDIS_AUTH_SERVICE_PASSWORD}}|$REDIS_AUTH_SERVICE_PASSWORD|g" \
  -e "s|{{REDIS_PARSER_SERVICE_PASSWORD}}|$REDIS_PARSER_SERVICE_PASSWORD|g" \
  /etc/redis/users.template.acl > /etc/redis/users.acl

echo "[init-redis] Done. users.acl file is ready."