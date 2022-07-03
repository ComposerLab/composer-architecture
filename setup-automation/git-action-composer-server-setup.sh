#!/bin/bash

gh secret set AWS_ACCESS_KEY_ID -b $(terraform output -raw publisher_access_key) -o ComposerLab -r composer-server
gh secret set AWS_SECRET_ACCESS_KEY -b $(terraform output -raw publisher_secret_key) -o ComposerLab -r composer-server
gh secret set AWS_REGION -b $(terraform output -raw aws_region) -o ComposerLab -r composer-server
gh secret set ECR_REPOSITORY_NAME -b $(terraform output -raw ecr_server_repository_name) -o ComposerLab -r composer-server
gh secret set ECS_CLUSTER -b $(terraform output -raw ecs_cluster) -o ComposerLab -r composer-server
gh secret set ECS_SERVICE -b $(terraform output -raw ecs_service_server) -o ComposerLab -r composer-server