#!/bin/bash
while ! pg_isready -h $PG_HOSTNAME > /dev/null 2> /dev/null; do
    echo "Waiting for database"
    sleep 1
done

if ! psql postgresql://$PG_USER:$PG_PASSWD@$PG_HOSTNAME -lqt | cut -d \| -f 1 | grep -qw $PG_DATABASE; then
    echo "Database $PG_DATABASE does not exist"
    echo "Creating ..."
    mix setup
fi

mix ecto.migrate
mix phx.server
