# Create (Application) Load balancer for public
resource "aws_lb" "my-alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my-sg.id]
  subnets            = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
}

# Create (Application) Load balancer listner rule for public
resource "aws_lb_listener" "alb_lst" {
  load_balancer_arn = aws_lb.my-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-TG.arn
  }
}


################################################################################################

# Create (Application) Load balancer for private
resource "aws_lb" "my-alb-priv" {
  name               = "my-alb-priv"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.db-sg.id]
  subnets            = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]
}

# Create (Application) Load balancer listner rule for private
resource "aws_lb_listener" "alb-priv_lst" {
  load_balancer_arn = aws_lb.my-alb-priv.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-priv-TG.arn
  }
}