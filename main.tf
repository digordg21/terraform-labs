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
  key_name = "iac-abed"
  user_data = <<-EOF
                #!/bin/bash
                cd /home/ubuntu
                echo "<h1>Terraform OLA MUNDO</h1>" > index.html
                nohup busybox -httpd -f -p 8080 &
                EOF
  tags = {
    Name = "teste com index.html"
  }
}