provider "aws" {
  region                        = "us-west-2"
  access_key                    = "my-access-key"
  secret_key                    = "my-secret-key"
}



resource "aws_instance" "firstec2" {
    ami                             = "ami-003634241a8fcdec0"
    instance_type                   = "t2.micro"
    key_name                        = "ansible"
    vpc_security_group_ids          = [ "sg-003772772f5073f26" ]
    associate_public_ip_address     = true
    tags = {
        Name                        = "firstec2"
    }
}