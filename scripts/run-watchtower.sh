#!/bin/bash

# Get Docker API version dynamically
DOCKER_API=$(docker version --format '{{.Server.APIVersion}}' 2>/dev/null || echo "1.44")

echo "Using Docker API version: $DOCKER_API"

docker run --rm \
    -e DOCKER_API_VERSION="$DOCKER_API" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower:latest \
    --run-once \
    --cleanup \
    --debug
