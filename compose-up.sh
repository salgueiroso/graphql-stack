#!/usr/bin/env bash

export STACK_NAME=graphql
# export CONTAINER_NAME=banco
export NETWORK_NAME=$STACK_NAME

function remove_stack() {
    echo "Removing stack $STACK_NAME..."

    docker compose -f ./docker-compose.yaml down --remove-orphans -v

    docker container prune -f

    docker volume prune -f

    docker image prune -f
}

if [[ "$@" =~ "--remove" ]]; then
    remove_stack
else
    docker compose --progress=plain -f ./docker-compose.yaml up $1 $2 $3 $4 $5 $6 $7 $8 $9
    exit_code=$?
    if ! [[ " 0 130 " =~ " $exit_code " ]]; then
        exit $exit_code
    fi
fi
