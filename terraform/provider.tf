terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "${env.TF_STATE_BUCKET}"
    key            = "terraform.tfstate"
    region         = "${env.AWS_REGION}"
    dynamodb_table = "${env.TF_LOCK_TABLE}"
  }
}

provider "aws" {
  region = var.aws_region
}

