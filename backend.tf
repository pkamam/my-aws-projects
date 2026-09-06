terraform {
  backend "s3" {
    bucket = "pkamam-terraform-state-2026"
    key    = "static-website/terraform.tfstate"
    region = "us-east-1"
  }
}
