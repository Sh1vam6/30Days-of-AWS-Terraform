variable "Environment" {
  type    = string
  default = "Staging"
}
variable "bucket_name" {
  type    = string
  default = "day-6-bucket-of-30daysofawsterraform-series"

}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_count" {
  type    = number
  default = 3
}

variable "monitoring_enabled" {
  type    = bool
  default = true
}

variable "associate_public_ip" {
  type    = bool
  default = true
}

# list
variable "allowed_cidr_blocks_list" {

  type        = list(string)
  description = "list of allowed cidr blocks for security group"
  default     = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]

}

# set
variable "allowed_cidr_blocks_list_set" {

  type        = set(string)
  description = "list of allowed cidr blocks for security group"
  default     = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]

}

# map 

variable "instance_tags" {
  type        = map(string)
  description = "tags to apply on instance"
  default = {
    "Environment" = "dev"
    "project"     = "Day7-terraform"
    "owner"       = "shivam"

  }
}

#tuple
variable "network_config" {
  type        = tuple([string, string, number])
  description = "Network configuration (VPC CIDR, subnet CIDR, port number)"
  default     = ["10.0.0.0/16", "10.0.1.0/24", 443]
}


# object type

variable "server_config" {
  type = object({
    name           = string
    instance_type  = string
    monitoring     = bool
    storage_gb     = number
    backup_enabled = bool
  })
  description = "Complete server configuration object"
  default = {
    name           = "web-server"
    instance_type  = "t2.micro"
    monitoring     = true
    storage_gb     = 20
    backup_enabled = false
  }

}