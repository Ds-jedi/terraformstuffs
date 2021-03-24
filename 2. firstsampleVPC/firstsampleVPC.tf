provider "aws" {
  region                        = "us-west-2"
  access_key                    = "my-access-key"
  secret_key                    = "my-secret-key"
}



resource "aws_vpc" "mynewvpc" {
  cidr_block                    = "10.0.0.0/16"
  instance_tenancy              = "default"

  tags = {
    Name                        = "mynewvpc"
  }
}