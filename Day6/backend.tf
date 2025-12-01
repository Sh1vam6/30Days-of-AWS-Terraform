terraform {
   backend "s3" {
    bucket = "30daysofawsterraform-remote-backend-bucket"
    key    = "Day06/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }

}