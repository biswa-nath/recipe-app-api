#!/bin/sh

set -e

# Validate required environment variables
REQUIRED_VARS="LISTEN_PORT APP_HOST APP_PORT"
for var in $REQUIRED_VARS; do
    value=$(printenv "$var")
    if [ -z "$value" ]; then
        echo "Error: Required environment variable $var is not set"
        exit 1
    fi
done

envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf
nginx -g 'daemon off;'
