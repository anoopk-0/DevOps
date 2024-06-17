# Configure the Terraform backend to use the S3 bucket
terraform {
  backend "s3" {
    bucket = "backend-terraform-demo"
    key    = "states/terraform.tfstate" # Specify the name of the state file
    region = "ap-south-1"               # Specify the AWS region
    # Optional: Specify a DynamoDB table for state locking
  }
}
