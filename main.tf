provider "aws" {
region = "eu-west-1"
access_key = "{env.AWS_ACCESS_KEY_ID}"
secret_key = "{env.AWS_SECRET_ACCESS_KEY}"
}
/* created first vpc */

resource "aws_vpc" "vpc-adam" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "dedicated"

  tags = {
    Name = "vpc-adam"
  }
}

/* create first instance */
resource "aws_instance" "app_two_instance" {
ami = "-------"
instance_type = "t2.micro"
subnet_id = "public-subnet-app-two"
tags = {
  Name = "app-adam-two"
  }
}

/* create second instance */
resource "aws_instance" "db_two_instance" {
ami = "ami-1bd9c57f"
instance_type = "t2.micro"
subnet_id = "private-subnet-app-two"
tags = {
  Name = "db-adam-two"
  }
}

resource "aws_subnet" "public-subnet-app-two" {
    vpc_id = "vpc-two"
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "app-public-subnet-two"
    }
}


resource "aws_subnet" "private-subnet-app-two" {
    vpc_id = "vpc-two"
    cidr_block = "10.0.0.12/24"
    tags = {
        Name = "db-priavte-subnet-two"
    }
}
