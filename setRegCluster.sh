#!/bin/bash

CLUSTER_NAME="loan-predictor-local"
REGISTRY_PORT="12345"
# GH_ORG="andromeda360"
# GH_REPO="a360-flux"
# GIT_URL="ssh://git@github.com/andromeda360/a360-flux.git"
# KEY_PATH="${HOME}/.ssh/id_ed25519"
# FLUX_PATH="clusters/local"
# CONFIG_FILE="./.a360cfg"

VERSION=1.0.0
CURRENT_DIR=$(pwd)


k3d registry create loan-predictor.localhost -p 12345 ;
k3d cluster delete ${CLUSTER_NAME} &&
k3d cluster create ${CLUSTER_NAME} \
--port "31380:31380@loadbalancer" \
--registry-use k3d-loan-predictor.localhost:12345 \
--image rancher/k3s:v1.20.9-k3s1

echo "cluster creation is done************************************"

namespace="loan-predictor"
kubectl config use-context k3d-loan-predictor-local
