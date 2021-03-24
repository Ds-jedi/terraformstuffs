resource "aws_s3_bucket" "myfirsts3bucket" {

    bucket              = "skjdfhkjsah.com"
    depends_on          = [ aws_vpc.myfirstvpc ]

}