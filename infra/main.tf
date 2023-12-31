terraform {

  required_providers {

    aws = {

      source  = "hashicorp/aws"
      version = "~> 4.0"

    }
  }
}

#Configuring the terraform backend
terraform {

  backend "s3" {

    bucket = "terraform-backend-269012942764"
    key    = "DevOps-learning-project.tfstate"
    region = "us-east-1"

  }
}

# Configure the AWS Provider
provider "aws" {

  region = "us-east-1"

}