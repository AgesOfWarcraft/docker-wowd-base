#!/bin/bash
set -e

apt-get update && apt-get install -y curl apt-transport-https ca-certificates make software-properties-common

export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt-get update && apt-get install -y google-cloud-sdk


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial edge"

apt-get update && apt-get install -y docker-ce

export DOCKERHUB_PASSWORD=$(echo "$DOCKERHUB_PASSWORD_ENC" |base64 -d | gcloud kms decrypt --ciphertext-file=- --plaintext-file=- --location global --keyring github-secrets --key key)

echo "$DOCKERHUB_PASSWORD" | docker login --password-stdin --username $DOCKERHUB_USERNAME
docker build . -t $DOCKERHUB_USERNAME/wowd-base:run -f run.dockerfile
docker push $DOCKERHUB_USERNAME/wowd-base:run

docker build . -t $DOCKERHUB_USERNAME/wowd-base:develop -f develop.dockerfile
docker push $DOCKERHUB_USERNAME/wowd-base:develop
