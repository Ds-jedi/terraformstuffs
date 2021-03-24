resource "aws_vpc" "created" {
    cidr_block              = var.vpccidr
    tags                    = {
        Name                = var.nameofvpc
    }
}


resource "aws_subnet" "subnets" {
    count                   = length(var.subnetscidrs) 
    vpc_id                  = aws_vpc.created.id
    cidr_block              = var.subnetscidrs[count.index]
}


output "vpcid" {
value                       = aws_vpc.created.id
}