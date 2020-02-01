provider "aws" {
  region = var.region-aws
  shared_credentials_file = var.shared_cred_file
}


resource "aws_key_pair" "moninstanceec2" {
	public_key = "${file("ssh/id_rsa.pub")}"
}





resource "aws_instance" "moninstanceec2" {
  ami = "ami-0d7e30ce437a761bb"
  instance_type = "t2.micro"
  key_name= aws_key_pair.moninstanceec2.key_name
  /*count = 1*/
  security_groups = [aws_security_group.moninstanceec2.name]
  tags = {
    Owner = "alex"
    Name = var.nom_instance
  }


  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = "${file("ssh/id_rsa")}"
      host     = self.public_ip
    }

    inline = [
      "sudo apt-get install python"/*,
      "echo attente 3min",
      "sleep 120",
      "echo attente 1min",
      "sleep 30",
      "echo attente 30s",
      "sleep 30"*/

    ]
  }


}



resource "aws_security_group" "moninstanceec2"{
  ingress {
    from_port = 8888
    protocol = "tcp"
    to_port = 8888
    /*cidr_blocks = ["0.0.0.0/0"]*/
    self = true
  }
  ingress {
    from_port = 8899
    protocol = "tcp"
    to_port = 8899
   /* cidr_blocks = ["0.0.0.0/0"]*/
    self = true
  }


  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
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

resource "aws_eip_association" "moninstanceec2" {
  instance_id   = aws_instance.moninstanceec2.id
  allocation_id = "eipalloc-02117ce1493297136"
}

resource "null_resource" "example2" {
  provisioner "local-exec" {

    command = "echo '[all]\n${aws_eip_association.moninstanceec2.public_ip}\n[all:vars]\nansible_ssh_private_key_file=ssh/id_rsa' > hosts"
  }
}

resource "null_resource" "configportail" {
  provisioner "local-exec" {

    command = "echo 'ip.geoposition=${aws_eip_association.moninstanceec2.private_ip_address}\nport.geoposition=8899\nip.myphotos=${aws_eip_association.moninstanceec2.private_ip_address}\nport.myphotos=8888' > /root/properties/configuration-portail.properties"
  }
}



