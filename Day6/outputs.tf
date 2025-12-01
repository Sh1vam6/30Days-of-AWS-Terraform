output "ec2_id" {
  description = "instance id"
  value = aws_instance.Day6_instance.id
}

output "bucket_arn"{
    description = "bucket arn"
    value = aws_s3_bucket.Day6_bucket.arn
}