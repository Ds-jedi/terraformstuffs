provider "aws" {
  region                    = "us-west-2"
  access_key                = "my-access-key"
  secret_key                = "my-secret-key"
}

resource "aws_instance" "MynewEC2" {
  ami                       = "ami-0ec2b1175747b5db9"
  instance_type             = "t2.micro"

  tags = {
    Name = "MynewEC2"
  }
}