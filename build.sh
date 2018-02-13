#!/bin/bash

ELIXIR_IMG_VERSION=1.6.1

IMG_VERSION=${ELIXIR_IMG_VERSION}
DIR_NAME=${PWD##*/}
IMG_NAME=${DIR_NAME//_/-}
APP_NAME=$(echo "${DIR_NAME//-/_}" | tr '[:upper:]' '[:lower:]')
CURRENT_UID=`id -u $USER`
CURRENT_GID=`id -g $USER`

cat ./docker-compose.yml.tmpl | \
    sed "s/\${ELIXIR_IMG_VERSION}/${ELIXIR_IMG_VERSION}/g" | \
    sed "s/\${IMG_VERSION}/${IMG_VERSION}/g" | \
    sed "s/\${IMG_NAME}/${IMG_NAME}/g" > ./docker-compose.yml

docker build -t ${IMG_NAME}:${IMG_VERSION} .
docker-compose run --rm app mix new . --app ${APP_NAME}
sudo chown -R $CURRENT_UID:$CURRENT_GID src/
