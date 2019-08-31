#!/bin/bash
set -ex;
docker build -t provider .
if [ -z "${HYPERONE_ACCESS_TOKEN_SECRET}" ]; then
    echo "Run unit test ONLY";
    docker run -e HYPERONE_ACCESS_TOKEN_SECRET -e HYPERONE_PROJECT --target builder provider make test;
else
    echo "Run unit test AND acceptance test";
    docker run -e HYPERONE_ACCESS_TOKEN_SECRET -e HYPERONE_PROJECT --target builder provider make test testacc;
fi