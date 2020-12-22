terraform {
  backend "s3" {
    bucket         = "pokemon-6hbd5z79yyki8yis-state-bucket"
    key            = "pikachu/thunderbolt"
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

resource "null_resource" "motto" {
  triggers = {
    always = timestamp()
  }
  provisioner "local-exec" {
    command = "echo gotta catch em all"
  }
}
