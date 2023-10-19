#!/bin/bash

CONFIG_FILE="./.appcfg"
CURRENT_DIR=$(pwd)

source $CONFIG_FILE
prefix="loan-predictor"

function build_image() {  
    docker build -t $1:latest -f docker/$2.Dockerfile .
    k3d image import --cluster loan-predictor-local $1:latest  
    if [[ $2 == *"server"* ]]; then
        echo "server present"
        docker build -t celery:latest -f docker/celery.Dockerfile .
        k3d image import --cluster loan-predictor-local celery:latest
    fi
}
prefix="loan-predictor"
declare -a gitrepos=("server" "ui")

for repo in ${gitrepos[@]}; do
    echo    
    cd $APP_SERVICE_ROOT    
    echo "${repo}.........................................................."
    if [ -d ${prefix}-${repo} ]; then        
        cd ${prefix}-${repo}
        if [ "$(git fetch && git rev-list main...origin/main --count)" -gt "0" ]; then
            echo "Main branch behind origin/main."
            # git checkout main
            # git pull               
            git checkout main
            git pull
            build_image ${repo} ${prefix}-${repo}
        else
            echo "Main branch current or ahead of origin/main."
            git checkout main
            build_image ${repo} ${prefix}-${repo}
            fi
    else
        echo "Cloning repo."
        git clone git@github.com:amitsatpute-pyjs/${prefix}-${repo}.git
        # git checkout main
        cd ${prefix}-${repo}
        git checkout main
        build_image ${repo} ${prefix}-${repo}
    fi

done

cd $CURRENT_DIR