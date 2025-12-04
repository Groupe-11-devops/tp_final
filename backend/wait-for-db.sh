#!/bin/sh
set -e

host="$1"
shift
cmd="$@"

until pg_isready -h "$host" -U "$DB_USER" -d "$DB_NAME"; do
  echo "Waiting for PostgreSQL at $host..."
  sleep 1
done

exec $cmd
