resource "aws_security_group" "composer_web_lb_sg" {
  vpc_id = data.aws_vpc.vpc.id
  name   = "composer-web-lb-sg"
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "composer_server_lb_sg" {
  vpc_id = data.aws_vpc.vpc.id
  name   = "composer-server-lb-sg"
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "composer_web_tasks" {
  vpc_id = data.aws_vpc.vpc.id
  name   = "composer-web-tasks-sg"

  ingress {
    protocol        = "tcp"
    from_port       = local.composer_web_sg.from_port
    to_port         = local.composer_web_sg.to_port
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = [aws_security_group.composer_web_lb_sg.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "composer_server_tasks" {
  vpc_id = data.aws_vpc.vpc.id
  name   = "composer-server-tasks-sg"

  ingress {
    protocol        = "tcp"
    from_port       = local.composer_server_sg.from_port
    to_port         = local.composer_server_sg.to_port
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = [aws_security_group.composer_server_lb_sg.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "composer_rds" {
  name       = "composer-rds"
  subnet_ids = data.aws_subnet_ids.subnets.ids

  tags = {
    Name = "composer-rds"
  }
}

resource "aws_security_group" "rds" {
  name   = "composer-rds"
  vpc_id = data.aws_vpc.vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "composer-rds"
  }
}

resource "aws_db_parameter_group" "composer" {
  name   = "composer"
  family = "postgres13"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "composer_rds" {
  identifier             = "composer"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "13.7"
  username               = "composer_app"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.composer_rds.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.composer.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}