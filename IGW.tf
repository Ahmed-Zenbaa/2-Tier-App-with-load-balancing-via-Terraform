# configure the internet gateway
resource "aws_internet_gateway" "my-gw" {
 vpc_id = aws_vpc.my-vpc.id
 
 tags = {
   Name = "Project VPC IG"
 }
}