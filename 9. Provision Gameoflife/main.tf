
resource "aws_instance" "gameoflifeprimary" {
    ami                             = "ami-003634241a8fcdec0"
    instance_type                   = "t2.micro"
    key_name                        = var.keyname
    security_groups                 = var.securitygroups
    associate_public_ip_address     = true

    provisioner "remote-exec" {
        inline = [
                "sudo apt-get update",
                "sleep 5",
                "sudo apt-get install openjdk-8-jdk -y",
                "sleep 5",
                "sudo apt-get install tomcat8 -y",
                "sleep 5",
                "cd /var/lib/tomcat8/webapps",
                "sudo wget https://github.com/GitPracticeRepo/game-oflife/blob/master/gameoflife.war",
                "sleep 5",
                "sudo service tomcat8 restart"
            ]
    connection {
    type                            = "ssh"
    user                            = "ubuntu"
    password                        = file("./sample.pem")
    host                            = aws_instance.gameoflifeprimary.public_ip
    }
    }
}
