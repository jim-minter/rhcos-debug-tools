#!/bin/bash

if [[ $# != 1 ]]; then
    echo example usage: $0 rhcos-debug-tools:4.18.0-147.8.1.el8_1
    exit 1
fi

docker build --build-arg VERSION=${1##*:} -t $1 .
if [[ $1 =~ / ]]; then
    docker push $1
fi
