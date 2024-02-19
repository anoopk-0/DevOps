provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
    ami           = "ami-03f4878755434977f"  # Specify an appropriate AMI ID
    instance_type = "t2.micro"
}