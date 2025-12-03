# Configure the s3 bucket
resource "aws_s3_bucket" "Day7_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Day-7-bucket"
    Environment = var.Environment
  }
}

# configure the aws instance
resource "aws_instance" "Day7_instance" {
  count         = var.instance_count
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t3.micro"

  monitoring                  = var.monitoring_enabled
  associate_public_ip_address = var.associate_public_ip

  tags = var.instance_tags
}

# configure sg 
resource "aws_security_group" "Day7-sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  tags        = var.instance_tags
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.Day7-sg.id
  #cidr_ipv4 =       var.allowed_cidr_blocks_list[0]
  cidr_ipv4   = tolist(var.allowed_cidr_blocks_list_set)[1]
  from_port   = var.network_config[2]
  ip_protocol = "tcp"
  to_port     = var.network_config[2]
}



resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.Day7-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


# using object variable type
resource "aws_instance" "Day7_instance_second" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = var.server_config.instance_type

  monitoring                  = var.server_config.monitoring
  associate_public_ip_address = var.associate_public_ip

  tags = {
    Name = var.server_config.name
  }

}

