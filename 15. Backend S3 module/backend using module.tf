provider "aws" {
  region                        = "us-west-2"
  access_key                    = "my-access-key"
  secret_key                    = "my-secret-key"
}


 module "terraform_state_backend" {
   source     = "git::https://github.com/cloudposse/terraform-aws-tfstate-backend.git?ref=master"
   namespace  = "eg"
   stage      = "test"
   name       = "terraform"
   attributes = ["state"]

   terraform_backend_config_file_path = "."
   terraform_backend_config_file_name = "backend.tf"
   force_destroy                      = false
 }

## importing module from here https://github.com/cloudposse/terraform-aws-tfstate-backend

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