provider "aws" {
  region = "us-east-1"
}

# Create an IAM Group for Developers
resource "aws_iam_group" "developers" {
  name = "developers-group"
}

# Create a restricted policy for S3 access
resource "aws_iam_group_policy" "s3_restricted_policy" {
  name  = "s3-restricted-policy"
  group = aws_iam_group.developers.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:::my-company-dev-bucket-xyz"
      }
    ]
  })
}

