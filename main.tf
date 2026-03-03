provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-GitHub-EC2"
  }
}

variable "aws_region" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "ami_id" {}
variable "instance_type" {}