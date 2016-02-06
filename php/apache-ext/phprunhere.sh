#!/bin/bash

if [ -z "$1" ]
  then
    echo "a name is required"
    exit
fi

docker run --rm \
 -v "${PWD}:${PWD}" \
 -e "VIRTUAL_HOST=${1}" \
 -e "VIRTUAL_PORT=80" \
 -l "traefik.port=80" \
 -e "WEB_ROOT=${PWD}" \
 -e "WWW_DATA_UID=${UID}" \
 -e "WWW_DATA_GID=`id -g $USER`" \
 --name "${1}" \
 mcnilz/php-develop