provider "aws" {
  region = "${var.region-aws}"
  shared_credentials_file = "${var.shared_cred_file}"
}


resource "aws_key_pair" "moninstanceec2" {
	public_key = "${file("ssh/id_rsa.pub")}"
}



resource "aws_instance" "moninstanceec2" {
  ami = "ami-0d7e30ce437a761bb"
  instance_type = "t2.micro"
  key_name= "${aws_key_pair.moninstanceec2.key_name}"
  count = 1
  security_groups = ["${aws_security_group.moninstanceec2.name}"]
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
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
  


}

