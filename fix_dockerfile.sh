#!/usr/bin/env bash
set -e
set -u
set -o pipefail
fix_name() {
    DOCKERFILE_NAME="Dockerfile"
    if [[ $CIRCLE_BRANCH = 'release' ]]; then 
        DOCKERFILE_NAME="$DOCKERFILE_NAME.prod"; 
    elif [[ $CIRCLE_BRANCH = 'test.1' ]]; then
        DOCKERFILE_NAME="$DOCKERFILE_NAME.test.1"
    else
        DOCKERFILE_NAME="$DOCKERFILE_NAME.dev"
    fi;

    mv -f ./$DOCKERFILE_NAME ./Dockerfile
}

fix_name
