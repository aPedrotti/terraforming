provider "aws" {
  #alias      = "east"
  region     = "us-east-1"
  version    = "~> 2.0"
  shared_credentials_file = "/Users/andre/.aws/credbkp"
  profile                 = "terraform"
}

terraform {
  backend "s3" {
    bucket = "bucket-1989"
    key    = "ec2-with-provisioner/tf-states.tfstate"
    region = "us-east-1"
  }
}

# docker run -itd -v $PWD:/app --name tf -w /app --entrypoint "" hashicorp/terraform:light sh
# docker run -itd tf sh