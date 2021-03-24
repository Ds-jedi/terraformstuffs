provider "aws" {
    region                          = "us-west-2"
    access_key                      = "my-access-key"
    secret_key                      = "my-secret-key"
}


variable "keyname" {
    type                            = string
}


variable "securitygroupid" {
    type                            = string
}
