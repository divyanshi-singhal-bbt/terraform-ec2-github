provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Get Default VPC
data "aws_vpc" "default" {
  default = true
}

# Get subnets of Default VPC
data "aws_subnets" "default_vpc" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# EC2 Instance
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnets.default_vpc.ids[0]

  tags = {
    Name = "Manual-Terraform-EC2"
  }
}