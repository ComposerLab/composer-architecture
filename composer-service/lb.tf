resource "aws_lb" "web_alb" {
  name               = local.web_lb["name"]
  internal           = local.web_lb["internal"]
  load_balancer_type = "application"
  subnets            = [local.subnet_01.id, local.subnet_02.id]
  security_groups    = [aws_security_group.composer_web_lb_sg.id]
}

resource "aws_lb" "server_alb" {
  name               = local.server_lb["name"]
  internal           = local.server_lb["internal"]
  load_balancer_type = "application"
  subnets            = [local.subnet_01.id, local.subnet_02.id]
  security_groups    = [aws_security_group.composer_server_lb_sg.id]
}

resource "aws_lb_target_group" "web_group" {
  name        = local.web_lb.target_group["name"]
  port        = local.web_lb.target_group["port"]
  protocol    = local.web_lb.target_group["protocol"]
  vpc_id      = data.aws_vpc.vpc.id
  target_type = "ip"

  depends_on = [aws_lb.web_alb]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group" "server_group" {
  name        = local.server_lb.target_group["name"]
  port        = local.server_lb.target_group["port"]
  protocol    = local.server_lb.target_group["protocol"]
  vpc_id      = data.aws_vpc.vpc.id
  target_type = "ip"

  depends_on = [aws_lb.server_alb]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "composer-web" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_group.arn
  }
}

resource "aws_lb_listener" "composer-server" {
  load_balancer_arn = aws_lb.server_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.server_group.arn
  }
}