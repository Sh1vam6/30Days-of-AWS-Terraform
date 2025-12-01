# Configure the s3 bucket
resource "aws_s3_bucket" "Day6_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Day-6-bucket"
    Environment = var.Environment
  }
}

# configure the aws instance
resource "aws_instance" "Day6_instance" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t3.micro"

  tags = {
    Name        = "Day-6-instance"
    Environment =  var.Environment
  }
}