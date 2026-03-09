resource "aws_s3_bucket" "docs_bucket" {

  bucket = "eks-docs-poc-${random_string.suffix.result}"

}

resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}