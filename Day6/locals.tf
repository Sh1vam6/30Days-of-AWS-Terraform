locals {
  common_tags = {
    Environment = var.Environment
    Project     = "Terraform-Demo"
  }
  
  full_bucket_name = "${var.Environment}-${var.bucket_name}"
}