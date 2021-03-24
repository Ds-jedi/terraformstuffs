
variable "nameofvpc" {
    description             = "name for vpc"
    default                 = "myvpc"
}

variable "vpccidr" {
    description             = "cidr of the vpc"
    default                 = "192.168.0.0/16"
}

variable "subnetcidrs" {
    description             = "subnet cidrs"
    type                    = list(string)
    default                 = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]
}

