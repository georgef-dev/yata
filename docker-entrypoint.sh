#!/bin/bash
set -e

rm -f /rails/tmp/pids/server.pid

if [ "$RAILS_ENV" != "production" ]; then
  echo "Waiting for DB..."
 while ! mariadb-admin ping -h"${DB_HOST}" --password="${DB_PASSWORD}" --skip-ssl --silent; do
   sleep 1
 done
fi

exec "$@"

