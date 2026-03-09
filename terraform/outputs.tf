output "cluster_name" {
  value = module.eks.cluster_name
}

output "bucket_name" {
  value = aws_s3_bucket.docs_bucket.bucket
}