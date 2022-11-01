variable "vpc" {
  type        = any
  default     = {}
  description = "AWS VPC configuration"
}

variable "aws_region" {
  type        = string
  default     = "ap-northeast-2"
  description = "AWS region"
}

variable "ecr_values_web" {
  type        = any
  default     = {}
  description = "AWS ECR web configuration"
}

variable "ecr_values_server" {
  type        = any
  default     = {}
  description = "AWS ECR server configuration"
}

variable "ecs_values" {
  type        = any
  default     = {}
  description = "AWS ECS configuration"
}

variable "ecs_values_web" {
  type        = any
  default     = {}
  description = "AWS ECS web configuration"
}

variable "ecs_values_server" {
  type        = any
  default     = {}
  description = "AWS ECS configuration"
}

variable "web_lb_values" {
  type        = any
  default     = {}
  description = "AWS WEB Load Balancer configuration"
}

variable "server_lb_values" {
  type        = any
  default     = {}
  description = "AWS SERVER Load Balancer configuration"
}

variable "container_web" {
  type        = any
  default     = {}
  description = "Container configuration to deploy"
}

variable "container_server" {
  type        = any
  default     = {}
  description = "Container configuration to deploy"
}

variable "composer_web_sg" {
  type        = any
  default     = {}
  description = "web security group"
}

variable "composer_server_sg" {
  type        = any
  default     = {}
  description = "server security group"
}

variable "composer_subnet_01" {
  type        = any
  default     = {}
  description = "web subnet"
}

variable "composer_subnet_02" {
  type        = any
  default     = {}
  description = "server subnet"
}

variable "db_password" {
  description = "RDS root user password"
  sensitive   = true
}