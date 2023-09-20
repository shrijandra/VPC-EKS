# Terraform Block
terraform {
  #required_version = ">= 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_version = ">= 1.0"   
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = ">= 3.0"  
      version = ">= 4.65"
    }
  }

  backend "s3" {
    bucket = "terraform-on-aws-eks5"
    key    = "dev/app1k8s"
    region = "us-east-1" 

    # For State Locking
    dynamodb_table = "dev-app1k8s"    
  }     
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  #access_key =
}

/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
