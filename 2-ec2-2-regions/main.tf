provider "aws" {
  alias      = "east"
  region     = "us-east-1"
  version    = "~> 2.0"
  access_key = var.access_key
  secret_key = var.secret_key
}

provider "aws" {
  alias      = "west"
  region     = "us-west-2"
  version    = "~> 2.0"
  access_key = var.access_key
  secret_key = var.secret_key
  #shared_credentials_file = "/Users/andre/.aws/credbkp"
  #profile                 = "terraform"
}

terraform {
  backend "s3" {
    bucket = "bucket-1989"
    key    = "tf-states.tfstate"
    region = "us-east-1"
  }
}

# docker run -itd -v $PWD:/app --name tf -w /app --entrypoint "" hashicorp/terraform:light sh
# docker run -itd tf sh