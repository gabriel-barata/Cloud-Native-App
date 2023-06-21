#!/bin/bash

repo_name=$(terraform output -raw repo_name)
repo_URL=$(terraform output -raw repo_URL)

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $repo_URL
docker build -t $repo_name .
docker tag $repo_name:latest $repo_URL/$repo_name:latest
docker push $repo_URL/$repo_name:latest