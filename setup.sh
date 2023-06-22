#!/bin/bash

deploy(){

    echo "Starting terraform resources..."
    cd infra && terraform init
    terraform plan
    terraform apply -auto-approve
    cd ..

    echo "Creating docker image and sending to ECR..."
    cd app && chmod +x ecr-push.sh
    ./ecr-push.sh
    cd ..

}

destroy(){

    cd infra
    terraform destroy -auto-approve
    repo_name=$(terraform output -raw repo_name)
    docker rmi $repo_name:latest

}

case $1 in
    deploy)
        deploy
        ;;
    destroy)
        destroy
        ;;
    *)
        echo "Usage: $0 {deploy | destroy}"
        ;;
esac