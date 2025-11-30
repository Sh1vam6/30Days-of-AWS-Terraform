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
    key    = "Day05/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

locals {
  common_tags = {
    Environment = var.Environment
    Project     = "Terraform-Demo"
  }
  
  full_bucket_name = "${var.Environment}-${var.bucket_name}"
}

variable "Environment" {
   default = "Staging"
}
variable "bucket_name" {
   default = "day-5-bucket-of-30daysofawsterraform-series"

}

# Configure the s3 bucket
resource "aws_s3_bucket" "Day5_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Day-4-bucket"
    Environment = var.Environment
  }
}

# configure the aws instance
resource "aws_instance" "Day5_instance" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t3.micro"

  tags = {
    Name        = "Day-5-bucket"
    Environment =  var.Environment
  }
}

output "ec2_id" {
  description = "instance id"
  value = aws_instance.Day5_instance.id
}

output "bucket_arn"{
    description = "bucket arn"
    value = aws_s3_bucket.Day5_bucket.arn
}