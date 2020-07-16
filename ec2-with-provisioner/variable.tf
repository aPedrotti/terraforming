variable "aws_regions" {
  default = "us-east-1"
}

variable "aws_amis" {
  default = "ami-0ac80df6eff0e70b5"
}

variable "key_public" {
  default = "custom_key"
  description = "key to be used / asigned to ec2 instance"
}

variable "instance_type" {
  default = "t2.micro"
} 
#Ami ubuntu per Region
#us-east-1 = "ami-0ac80df6eff0e70b5"
#us-west-1 = "ami-0d705db840ec5f0c5"