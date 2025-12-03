terraform {
  backend "s3" {
    bucket       = "30daysofawsterraform-remote-backend-bucket"
    key          = "Day08/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }

}