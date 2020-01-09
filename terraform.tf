provider "aws" {
  region = "${var.region-aws}"
  shared_credentials_file = "${var.shared_cred_file}"
}



resource "aws_instance" "moninstanceec2" {
  ami = "ami-087855b6c8b59a9e4"
  instance_type = "t2.micro"
  count = 1
  tags = {
    Owner = "alex"
    Name = "${var.nom_instance}"
  }
}

resource "aws_security_group" "moninstanceec2"{
  ingress {
    from_port = 8888
    protocol = "tcp"
    to_port = 8888
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  


}

