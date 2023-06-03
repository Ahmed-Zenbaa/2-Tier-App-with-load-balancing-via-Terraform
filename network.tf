# configure the vcp
resource "aws_vpc" "my-vpc" {
 cidr_block = "192.168.0.0/16"
 
 tags = {
   Name = "Project VPC"
 }
}



#Create Public subnet #1
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "192.168.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "public_subnet1"
  }
}

#Create Public subnet #2
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "192.168.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "public_subnet2"
  }
}

#Create Private subnet #1
resource "aws_subnet" "private_subnet1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "192.168.3.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"

  tags = {
    Name = "private_subnet1"
  }
}

#Create Private subnet #2
resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "192.168.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private_subnet2"
  }
}
