variable "hash_commit" {
  default = "806d52dafe9b7fddbc4f0d2d41086ed3cfa02a44"
}

variable "access_key" {
  default = "AKIA2KZRU6SH7O7QPKGE"
}
variable "secret_key" {
  default = "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"
}

variable "ami_ubuntu_west" {
  default     = "ami-003634241a8fcdec0"
  description = "Ubuntu Server 18.04 LTS (HVM), SSD Volume Type"
}

variable "ami_aws_docker" {
  default     = "ami-01d025118d8e760db"
  description = "Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type"
}

variable "instance_type" {
  default = "t2.micro"
} 