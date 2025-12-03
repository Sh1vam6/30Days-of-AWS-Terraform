# Using splat expression to get all bucket names
output "s3_bucket_name_by_count" {

  description = "names of s3 bucket with count"
  value       = aws_s3_bucket.buckets[*].id

}
# Using splat expression to get all bucket ARNs
output "s3_bucket_arn_by_count" {
  description = "arn of s3 buckets with count"
  value       = aws_s3_bucket.buckets[*].arn
}

# using loop to get all bucket names

output "s3_buckets_name_by_loop" {
  description = "getting all s3 buckets name using loop"
  value       = [for bucket in aws_s3_bucket.buckets_by_set : bucket.id]
}

# using loop to get all bucket arns

output "s3_buckets_arns_by_loop" {
  description = "getting all s3 buckets arns using loop"
  value       = [for bucket in aws_s3_bucket.buckets_by_set : bucket.arn]
}

# Creating a map output with bucket names and ARNs
output "s3_buckets_details_by_loop" {
  description = "getting id and arn of buckets using map"
  value = {
    for key, bucket in aws_s3_bucket.buckets_by_set :
    key => {
      id  = bucket.id
      arn = bucket.arn
    }
  }
}


