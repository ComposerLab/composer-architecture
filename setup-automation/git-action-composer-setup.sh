#!/bin/bash

gh secret set AWS_ACCESS_KEY_ID_WEB -b $(terraform output -raw publisher_access_key) -o ComposerLab -r composer-web
gh secret set AWS_ACCESS_KEY_ID_SERVER -b $(terraform output -raw publisher_access_key) -o ComposerLab -r composer-server

gh secret set AWS_SECRET_ACCESS_KEY_WEB -b $(terraform output -raw publisher_secret_key) -o ComposerLab -r composer-web
gh secret set AWS_SECRET_ACCESS_KEY_SERVER -b $(terraform output -raw publisher_secret_key) -o ComposerLab -r composer-server

gh secret set AWS_REGION_WEB -b $(terraform output -raw aws_region) -o ComposerLab -r composer-web
gh secret set AWS_REGION_SERVER -b $(terraform output -raw aws_region) -o ComposerLab -r composer-server

gh secret set ECR_REPOSITORY_NAME_WEB -b $(terraform output -raw ecr_web_repository_name) -o ComposerLab -r composer-web
gh secret set ECR_REPOSITORY_NAME_SERVER -b $(terraform output -raw ecr_server_repository_name) -o ComposerLab -r composer-server

gh secret set ECS_CLUSTER_WEB -b $(terraform output -raw ecs_cluster) -o ComposerLab -r composer-web
gh secret set ECS_CLUSTER_SERVER -b $(terraform output -raw ecs_cluster) -o ComposerLab -r composer-server

gh secret set ECS_SERVICE_WEB -b $(terraform output -raw ecs_service_web) -o ComposerLab -r composer-web
gh secret set ECS_SERVICE_SERVER -b $(terraform output -raw ecs_service_server) -o ComposerLab -r composer-server