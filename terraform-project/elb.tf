resource "aws_lb" "deepseek_lb" {
  name               = "deepseek-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.deepseek_sg.id]
  subnets            = var.subnets
  enable_deletion_protection = false
}

resource "aws_lb_target_group" "deepseek_target_group" {
  name     = "deepseek-target-group"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id
}

resource "aws_lb_listener" "deepseek_listener" {
  load_balancer_arn = aws_lb.deepseek_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.deepseek_target_group.arn
  }
}
