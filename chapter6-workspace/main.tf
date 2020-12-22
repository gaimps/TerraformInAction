terraform {
  backend "s3" {
    bucket         = "pokemon-6hbd5z79yyki8yis-state-bucket"
    key            = "team1/my-cool-project"
    region         = "ca-central-1"
    encrypt        = true
    role_arn       = "arn:aws:iam::601250549722:role/pokemon-6hbd5z79yyki8yis-tf-assume-role"
    dynamodb_table = "pokemon-6hbd5z79yyki8yis-state-lock"
  }
  required_version = "~> 0.13"
  required_providers {
    null = "~> 2.1"
  }
}

variable "region" {
  description = "AWS Region"
  type        = string
}

provider "aws" {

  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = terraform.workspace
  }
}
