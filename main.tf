provider "aws" {
 region = "us-west-1" // Your preferred region
}
resource "aws_instance" "web_server" {
 ami = "ami-xxxxxxxxxxxxxxxxx" // Ubuntu or any Dockercompatible AMI ID
 instance_type = "t2.micro"
 key_name = "your_key_pair_name"
 security_groups = ["your_security_group"]
 user_data = <<-EOF
 #!/bin/bash
 sudo apt-get update
 sudo apt-get install -y docker.io
 sudo docker run -d -p 80:80 nginx
 EOF
 tags = {
 Name = "WebServer"
 }
}
output "public_ip" {
 value = aws_instance.web_server.public_ip
}
