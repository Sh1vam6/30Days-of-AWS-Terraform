locals {
  common_tags = {
    Environment = var.Environment
    Project     = "Terraform-Day7"
  }

  full_bucket_name = "${var.Environment}-${var.bucket_name}"
}