# Create EC2 instances in public subnets
resource "aws_instance" "Pub1-ec2" {
  ami                         = "ami-006dcf34c09e50022"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_subnet1.id
  security_groups             = [aws_security_group.my-sg.id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>(App) EC2 instance launched in us-east-1a!!!</h1>" > var/www/html/index.html
    EOF
}

resource "aws_instance" "Pub2-ec2" {
  ami                         = "ami-006dcf34c09e50022"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_subnet2.id
  security_groups             = [aws_security_group.my-sg.id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>(App) EC2 instance launched in us-east-1b!!!</h1>" > var/www/html/index.html
    EOF
}

####################################################################################

# Create EC2 instances in private subnets
resource "aws_instance" "Priv1-ec2" {
  ami                         = "ami-006dcf34c09e50022"
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  subnet_id                   = aws_subnet.private_subnet1.id
  security_groups             = [aws_security_group.db-sg.id]
}

resource "aws_instance" "Priv2-ec2" {
  ami                         = "ami-006dcf34c09e50022"
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  subnet_id                   = aws_subnet.private_subnet2.id
  security_groups             = [aws_security_group.db-sg.id]
}

