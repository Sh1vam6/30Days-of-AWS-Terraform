# Count -> meta-argument

resource "aws_s3_bucket" "buckets" {

  count  = length(var.s3_buckets_name)
  bucket = var.s3_buckets_name[count.index]

  tags = {
    Name      = var.s3_buckets_name[count.index]
    bucket_no = count.index + 1
  }
}

# for_each -> meta-argument
resource "aws_s3_bucket" "buckets_by_set" {

  for_each = var.s3_buckets_name_by_set
#   bucket   = each.key
    bucket = each.value

  tags = {
    Name = each.value
  }
}

# depends_on -> meta-argument

resource "aws_s3_bucket" "bucket-1" {
  bucket = "day8of30daysofawsterraform-primary-bucket"
  tags = {
    Name = var.Environment
  }
}


resource "aws_s3_bucket" "bucket-2" {
  bucket = "day8of30daysofawsterraform-secondary-bucket"
  tags = {
    Name = var.Environment
  }
  depends_on = [aws_s3_bucket.bucket-1]
}