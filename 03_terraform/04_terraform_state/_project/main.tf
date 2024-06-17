provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "_backend_storage" {
  ami           = "ami-03f4878755434977f" # Specify an appropriate AMI ID
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "backend-terraform-demo" # Specify a unique bucket name
  # Set the bucket ACL (Access Control List) to private
  # Additional bucket configurations (e.g., versioning, encryption, etc.) can be added here
}
