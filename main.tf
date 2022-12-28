terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "abed_IaC_server" {
  ami           = "ami-0530ca8899fac469f"
  instance_type = "t2.micro"

  tags = {
    Name = "primeira instancia"
  }
}
