provider "aws" {
  region                 = "us-west-2"
  access_key             = "my-access-key"
  secret_key             = "my-secret-key"
}


variable "cidrrnages" {
    type                = list(string)
    default             = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]
}
variable "subnetnames" {
    type                = list(string)
    default             = [ "subnet1", "subnet2", "subnet3"]
}


resource "aws_vpc" "myfirstvpc" {
    cidr_block          = "192.168.0.0/16"
}

resource "aws_subnet"  "mysubnet" {
  count                 = 3
  vpc_id                = aws_vpc.myfirstvpc.id
  cidr_block            = var.cidrrnages[count.index]

  tags = {
    Name                = var.subnetnames[count.index]
  }
}