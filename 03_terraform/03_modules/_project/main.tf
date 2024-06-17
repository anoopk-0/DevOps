provider "aws" {
  region = "ap-south-1"
}

module "ec2_intance" {
  source              = "../modules/ec2_instance"
  ami_value           = "ami-03f4878755434977f"
  instance_type_value = "t2.micro"
}
