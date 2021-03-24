resource "aws_s3_bucket" "mys3bucket" {

    bucket          = "qtbucketfromtf.com"
    tags            = {
        Purpose     = "terraform",
        Topic       = "environmental variables"
    }
}


resource "aws_s3_bucket" "yours3bucket" {
    
    bucket                  = "studentbucketfromtf.com"
    tags                    = {
        Purpose             = "terraform"
    }
}