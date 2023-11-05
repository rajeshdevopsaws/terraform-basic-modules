terraform {
# setting required providers and terraform version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5"
    }
  }

  required_version = ">= 1.1.0"
}

# setting provider and region
provider "aws" {
  # profile = "default"
  region  = "us-west-2"
}