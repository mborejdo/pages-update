#! /bin/bash

docker run --rm -v $(pwd)/data:/github/workspace/data/ --workdir /github/workspace/data/ mborejdo/action-rusty "wcloud" "--height 286 --width 780 --font fonts/FinkHeavy.ttf " "cloud.md" "header.png"
docker run --rm -v $(pwd)/data:/github/workspace/data/ --workdir /github/workspace/data/ mborejdo/action-rusty "sic -i ./images/header.png --invert -o header.png" "" 
docker run --rm -v $(pwd)/data:/github/workspace/data/ --workdir /github/workspace/data/ mborejdo/action-rusty "zola build" ""
#docker run --rm -e REPO="mborejdo.github.io" -e API_TOKEN_GITHUB=${API_TOKEN_GITHUB} -v $(pwd)/data:/github/workspace/data/ --workdir /github/workspace/data/ mborejdo/action-rusty "deno run --quiet -A ./index.ts" ""

