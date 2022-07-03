locals {
  vpc = var.vpc
  use_default_vpc = local.vpc.id == ""
  
  region = var.aws_region
  
# ////////////////////////////////////////////
  # 공용

  ecs = var.ecs_values

# ////////////////////////////////////////////
  # 웹

  web_ecr = var.ecr_values_web

  web_ecs = var.ecs_values_web

  web_container = var.container_web

  composer_web_sg = var.composer_web_sg

  subnet_01 = var.composer_subnet_01

  web_lb = var.web_lb_values

# /////////////////////////////////////////////
  # 서버

  server_ecr = var.ecr_values_server

  server_ecs = var.ecs_values_server

  server_container = var.container_server

  composer_server_sg = var.composer_server_sg

  subnet_02 = var.composer_subnet_02

  server_lb = var.server_lb_values

# /////////////////////////////////////////////
}