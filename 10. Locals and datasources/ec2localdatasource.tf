provider "aws" {
  region                 = "us-west-2"
  access_key             = "my-access-key"
  secret_key             = "my-secret-key"
}

data "aws_security_group" "mysecuritygroup" {
    name                 = "openall"
}

locals {
    common_tags = {
        Name             = "learning"
        Owner            = "DevOps"
    }
}

resource "aws_instance" "firstec2" {
    ami                              = "ami-003634241a8fcdec0"
    instance_type                    = "t2.micro"
    key_name                         = "terraform"
    security_groups                  = [ data.aws_security_group.mysecuritygroup.id ]
    associate_public_ip_address      = true
    tags                             = local.common_tags
}