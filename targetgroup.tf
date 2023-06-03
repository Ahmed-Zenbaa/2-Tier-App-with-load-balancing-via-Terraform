# Create an ALB target group
resource "aws_lb_target_group" "alb-TG" {
  name     = "alb-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my-vpc.id
}

# Application Load balancer-Target group attachment
resource "aws_lb_target_group_attachment" "my-alb-tg-att" {
  target_group_arn = aws_lb_target_group.alb-TG.arn
  target_id        = aws_instance.Pub1-ec2.id
  port             = 80
}

# Application Load balancer-Target group attachment
resource "aws_lb_target_group_attachment" "my-alb-tg-att2" {
  target_group_arn = aws_lb_target_group.alb-TG.arn
  target_id        = aws_instance.Pub2-ec2.id
  port             = 80
}


####################################################3

# Create an NLB target group
resource "aws_lb_target_group" "alb-priv-TG" {
  name     = "alb-priv-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my-vpc.id
}

# Network Load balancer-Target group attachment
resource "aws_lb_target_group_attachment" "my-alb-priv-TG-att" {
  target_group_arn = aws_lb_target_group.alb-priv-TG.arn
  target_id        = aws_instance.Priv1-ec2.id
  port             = 80
}

# Network Load balancer-Target group attachment
resource "aws_lb_target_group_attachment" "my-alb-priv-TG-att2" {
  target_group_arn = aws_lb_target_group.alb-priv-TG.arn
  target_id        = aws_instance.Priv2-ec2.id
  port             = 80
}