provider "aws" {
  version = "~> 3.0"
  region = "ca-central-1"
}
 
resource "aws_instance" "helloworld" {
  ami = "ami-0edab43b6fa892279"
  instance_type = "t2.micro"
}