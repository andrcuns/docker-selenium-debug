#!/bin/bash

VERSION="3.4.0-chromium"
VERSION_NUMBER=$(echo $VERSION | awk -F- '{ print $1 }')
IMAGE="node-$BROWSER-debug"
image_major="andrcuns/$IMAGE:$VERSION_NUMBER"
image_minor="andrcuns/$IMAGE:$VERSION"
image_latest="andrcuns/$IMAGE:latest"

echo "Generating docker file to build"
bash generate.sh "$IMAGE:$VERSION"

echo "Building image for $BROWSER browser"
docker build -t $image_latest -t $image_major -t $image_minor .

echo "Pushing images"
docker push $image_latest
docker push $image_major
docker push $image_minor
