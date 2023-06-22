#!/bin/bash

## This command creates a docker image based on the ../app/dockerfile and send it to our AWS ECR
repo_name=$(terraform output -raw repo_name)
repo_URL=$(terraform output -raw repo_URL)
repo_id=$(echo "$repo_URL" | cut -d'/' -f1)

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $repo_id
cd ../app
docker build -t $repo_name:latest .
docker tag $repo_name:latest $repo_URL:latest
docker push $repo_URL:latest

echo "Image sent succesfully to $repo_URL!"