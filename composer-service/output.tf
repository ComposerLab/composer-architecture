output "aws_region" {
  value       = local.region
  description = "The AWS region used"
}

output "web_app_url" {
  value       = aws_lb.web_alb.dns_name
  description = "The WEB ALB DNS"
}

output "server_app_url" {
  value       = aws_lb.server_alb.dns_name
  description = "The SERVER ALB DNS"
}

output "publisher_access_key" {
  value       = aws_iam_access_key.publisher.id
  description = "AWS_ACCESS_KEY to publish to ECR"
}

output "publisher_secret_key" {
  value       = aws_iam_access_key.publisher.secret
  description = "AWS_SECRET_ACCESS_KEY to upload to the ECR"
  sensitive   = true
}

output "ecr_web_url" {
  value       = aws_ecr_repository.web_repository.repository_url
  description = "The ECR web repository URL"
}

output "ecr_server_url" {
  value       = aws_ecr_repository.server_repository.repository_url
  description = "The ECR server repository URL"
}

output "ecr_web_repository_name" {
  value       = aws_ecr_repository.web_repository.name
  description = "The ECR web repository name"
}

output "ecr_server_repository_name" {
  value       = aws_ecr_repository.server_repository.name
  description = "The ECR server repository name"
}

output "ecs_cluster" {
  value       = aws_ecs_cluster.cluster.name
  description = "The ECS cluster name"
}

output "ecs_service_web" {
  value       = aws_ecs_service.service_web.name
  description = "The ECS web name"
}

output "ecs_service_server" {
  value       = aws_ecs_service.service_server.name
  description = "The ECS server name"
}

output "web_container_name" {
  value       = local.web_container
  description = "Container name for the ECS task"
}

output "server_container_name" {
  value       = local.server_container
  description = "Container name for the ECS task"
}