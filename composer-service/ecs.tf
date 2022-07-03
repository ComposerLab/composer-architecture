resource "aws_ecs_cluster" "cluster" {
  name               = local.ecs["cluster_name"]
  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = "100"
  }
}

resource "aws_ecs_task_definition" "task_web" {
  family = "composer-web"
  requires_compatibilities = [
    "FARGATE",
  ]
  execution_role_arn = aws_iam_role.fargate.arn
  network_mode       = "awsvpc"
  cpu                = 256
  memory             = 512
  container_definitions = jsonencode([
    {
      name      = local.web_container.name
      image     = local.web_container.image
      essential = true
      portMappings = [
        for port in local.web_container.ports :
        {
          containerPort = port
          hostPort      = port
        }
      ]
    }
  ])
}

resource "aws_ecs_task_definition" "task_server" {
  family = "composer-server"
  requires_compatibilities = [
    "FARGATE",
  ]
  execution_role_arn = aws_iam_role.fargate.arn
  network_mode       = "awsvpc"
  cpu                = 256
  memory             = 512
  container_definitions = jsonencode([
    {
      name      = local.server_container.name
      image     = local.server_container.image
      essential = true
      portMappings = [
        for port in local.server_container.ports :
        {
          containerPort = port
          hostPort      = port
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "service_web" {
  name            = local.web_ecs.service_name
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task_web.arn
  desired_count   = 1

  network_configuration {
    security_groups  = [aws_security_group.composer_web_tasks.id]
    subnets          = [local.subnet_01.id, local.subnet_02.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.web_group.arn
    container_name   = local.web_container.name
    container_port   = local.web_container.ports[0]
  }
  
  deployment_controller {
    type = "ECS"
  }
  
  capacity_provider_strategy {
    base              = 0
    capacity_provider = "FARGATE"
    weight            = 100
  }
}

resource "aws_ecs_service" "service_server" {
  name            = local.server_ecs.service_name
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task_server.arn
  desired_count   = 1

  network_configuration {
    security_groups  = [aws_security_group.composer_server_tasks.id]
    subnets          = [local.subnet_01.id, local.subnet_02.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.server_group.arn
    container_name   = local.server_container.name
    container_port   = local.server_container.ports[0]
  }
  
  deployment_controller {
    type = "ECS"
  }
  
  capacity_provider_strategy {
    base              = 0
    capacity_provider = "FARGATE"
    weight            = 100
  }
}