terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-06067086cf86c58e6"  
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformDemo"
  }
}