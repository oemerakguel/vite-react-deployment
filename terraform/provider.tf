terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-vite-app-state-12345"
    key            = "terraform.tfstate"
    region         = "${env.AWS_REGION}"
  }
}

provider "aws" {
  region = var.aws_region
}

