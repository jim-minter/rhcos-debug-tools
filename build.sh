#!/bin/bash

if [[ $# != 2 ]]; then
    echo example usage: $0 rhcos-debug-tools 4.18.0-147.8.1.el8_1
    exit 1
fi

for f in base full; do
  docker build --build-arg VERSION=$2 --build-arg BASE=$1-base:$2 -f Dockerfile.$f -t $1-$f:$2 .
done

if [[ $1 =~ / ]]; then
  for f in base full; do
      docker push $1-$f:$2
  done
fi
