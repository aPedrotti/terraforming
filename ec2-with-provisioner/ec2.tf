locals { 
  #conn_host = "${self.public_ip}"
  conn_type = "ssh"
  conn_user = "ubuntu"
  conn_timeout = "1m"
  conn_key  = tls_private_key.pkey.private_key_pem
  #conn_key = "${file("~/Documents/terraform.pem")}"
}

resource "aws_instance" "web" {
  #provider = aws.east
  ami = var.aws_amis
  instance_type = var.instance_type
  key_name = var.key_public
  security_groups = ["${aws_security_group.default.name}"]
  tags = {
    Name = "Scripting"
    name = "instance-for-scripting"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
    ]
    connection { 
      host = self.public_ip
      type = local.conn_type
      user = local.conn_user
      timeout = local.conn_timeout
      private_key = local.conn_key
    }
  }

  provisioner "local-exec" {
    command = "sleep 15 && echo '${tls_private_key.pkey.private_key_pem}' > private_key.pem"
  }
  provisioner "local-exec" {
    command = "chmod 400 private_key.pem"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.web.public_ip} > instance_ip"
  }
}

resource "tls_private_key" "pkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "keypair" {
  key_name   = var.key_public
  public_key = tls_private_key.pkey.public_key_openssh
}

