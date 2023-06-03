# configure the route tables
resource "aws_route_table" "to_IGW_rt" {
 vpc_id = aws_vpc.my-vpc.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.my-gw.id
 }
 
 tags = {
   Name = "Route Table To IGW"
 }
}
