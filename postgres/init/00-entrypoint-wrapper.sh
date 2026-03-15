#!/usr/bin/env bash

set -euo pipefail

INIT_DIR="/docker-entrypoint-initdb.d"
SQL_FILE="${INIT_DIR}/01-init.sql"
TMP_FILE="${INIT_DIR}/01-init-tmp.sql"

echo "[init-wrapper] Resolving environment variables in SQL init file..."

sed \
  -e "s/{{AUTH_SERVICE_DB_PASSWORD}}/${AUTH_SERVICE_DB_PASSWORD}/g" \
  -e "s/{{PARSER_SERVICE_DB_PASSWORD}}/${PARSER_SERVICE_DB_PASSWORD}/g" \
  "${SQL_FILE}" > "${TMP_FILE}"

mv "${TMP_FILE}" "${SQL_FILE}"

echo "[init-wrapper] Done. SQL file is ready."