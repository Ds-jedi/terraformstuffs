provider "aws" {
  region                    = "us-west-2"
  access_key                = "my-access-key"
  secret_key                = "my-secret-key"
}

module "myvpc" {
  source        = "./modules/myvpc"

  vpccidr       = "192.168.0.0/16"
  
}

data "aws_subnet_ids" "batman" {
    vpc_id      = module.myvpc.vpcid      

                           ## vpcid is the output in /modules/myvpc/output ##
}

resource "aws_instance" "MynewEC2" {
    ami                             = "ami-0ec2b1175747b5db9"
    instance_type                   = "t2.micro"
    key_name                        = "keypair" 
    subnet_id                       = data.aws_subnet_ids.batman.id
    associate_public_ip_address     = true
    tags = {
        Name                        = "firstec2"
    }
}
