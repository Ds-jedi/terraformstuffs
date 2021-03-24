provider "aws" {
  region                        = "us-west-2"
  access_key                    = "my-access-key"
  secret_key                    = "my-secret-key"
}


terraform {
    backend "s3" {
        bucket          = "terraform-remote-state-storage-s3"
        region          = "us-west-2"
        key             = "path/to/state/file"
        dynamodb_table = "terraform-state-lock-dynamo"
 }
}

## Assuming u already  created a s3 bucket and dynamodb table
## with full IAM permission  to terraform

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