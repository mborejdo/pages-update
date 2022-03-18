#! /bin/bash

docker run --rm -v $(pwd)/data:/github/workspace/data/ --workdir /github/workspace/data/ mborejdo/docker-rusty-bins zola build
