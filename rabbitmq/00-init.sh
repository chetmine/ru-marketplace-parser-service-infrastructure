#!/bin/bash
hash_password() {
  python3 -c "
import hashlib, os, base64, sys
password = sys.argv[1].encode()
salt = os.urandom(4)
salted = salt + hashlib.sha256(salt + password).digest()
print(base64.b64encode(salted).decode())
" "$1"
}

echo "[init-rabbitmq] Resolving environment variables in definitions.json file..."

PARSER_HASH=$(hash_password "$PARSER_SERVICE_RABBITMQ_PASSWORD")
AUTH_HASH=$(hash_password "$AUTH_SERVICE_RABBITMQ_PASSWORD")

sed \
  -e "s|{{PARSER_HASH}}|$PARSER_HASH|g" \
  -e "s|{{AUTH_HASH}}|$AUTH_HASH|g" \
  /etc/rabbitmq/definitions.template.json > /etc/rabbitmq/definitions.json

echo "[init-rabbitmq] Done. definitions.json file is ready."