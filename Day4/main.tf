terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  
  # Configuring remote backend for our state file
  backend "s3" {
    bucket = "30daysofawsterraform-remote-backend-bucket"
    key    = "Day04/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}



# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Configure the s3 bucket
resource "aws_s3_bucket" "Day4_bucket" {
  bucket = "day-4-bucket-of-30daysofawsterraform-series"

  tags = {
    Name        = "Day-4-bucket"
    Environment = "Staging"
  }
}