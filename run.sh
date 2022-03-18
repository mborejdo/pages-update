#! /bin/bash

docker run --rm -v $(pwd)/data:/github/workspace/data/ --workdir /github/workspace/data/ mborejdo/action-rusty "zola" "--help"
