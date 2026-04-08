#!/usr/bin/env sh
set -e

IMAGE="ghcr.io/curiousjaki/marker-devcontainer"
TAG="${1:-latest}"

echo "Building $IMAGE:$TAG ..."
docker build --platform linux/amd64 -t "$IMAGE:$TAG" .

echo "Pushing $IMAGE:$TAG ..."
docker push "$IMAGE:$TAG"

if [ "$TAG" != "latest" ]; then
  echo "Tagging and pushing as latest ..."
  docker tag "$IMAGE:$TAG" "$IMAGE:latest"
  docker push "$IMAGE:latest"
fi

echo "Done: $IMAGE:$TAG"
