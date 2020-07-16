resource "aws_instance" "web" {
  provider      = aws.east
  ami           = var.ami_aws_docker
  instance_type = var.instance_type
  tags = {
    Name = "HelloWorld-From-East"
  }
}

resource "aws_instance" "west" {
  provider      = aws.west
  ami           = var.ami_ubuntu_west
  instance_type = var.instance_type

  tags = {
    Name = "HelloWorld-From-West"
  }
}