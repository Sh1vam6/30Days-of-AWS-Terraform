# using list
variable "s3_buckets_name" {
  description = "s3 buckets name"
  type        = list(string)
  default     = ["day8of30daysawsterraform-bucket-1", "day8of30daysawsterraform-bucket-2"]
}

# using set 

variable "s3_buckets_name_by_set" {
  type    = set(string)
  default = ["day8of30daysawsterraform-bucket-1-by-set", "day8of30daysawsterraform-bucket-2-by-set"]
}

variable "Environment" {
  default = "dev"

}