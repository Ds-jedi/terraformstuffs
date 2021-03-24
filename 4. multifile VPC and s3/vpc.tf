resource "aws_vpc" "mynewvpc" {
  count                         = 3
  cidr_block                    = "10.0.0.0/16"
  instance_tenancy              = "default"

  tags = {
    Name                        = "mynewvpc ${count.index}"
  }
}