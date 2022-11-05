# Composer Architecture

## 개발 환경 설정

```
환경설정
- /composer-service/terraform.tfvars

vpc = {
  id = "${vpc_id}"
}

aws_region = "ap-northeast-2"

ecs_values = {
  cluster_name = "composer-cluster"
}

ecs_values_web = {
  service_name = "composer-web-service"
}

ecs_values_server = {
  service_name = "composer-server-service"
}

ecr_values_web = {
  repository_name = "composer-web"
}

ecr_values_server = {
  repository_name = "composer-server"
}

web_lb_values = {
  name     = "composer-web-alb"
  internal = false
  target_group = {
    name     = "composer-web-alb-tg"
    port     = ${composer-web-alb.port}
    protocol = "HTTP"
  }
}

server_lb_values = {
  name     = "composer-server-alb"
  internal = false
  target_group = {
    name     = "composer-server-alb-tg"
    port     = ${composer-server-alb.port}
    protocol = "HTTP"
  }
}

container_web = {
  name  = "composer-web"
  image = "master"
  ports = [${composer-web-alb.port}]
}

composer_web_sg = {
  from_port    = 80
  to_port      = ${composer-web-alb.port}
}

container_server = {
  name  = "composer-server"
  image = "master"
  ports = [${composer-server-alb.port}]
}

composer_server_sg = {
  from_port    = 80
  to_port      = ${composer-server-alb.port}
}

composer_subnet_01 = {
  id = "${composer_subnet_01}"
}

composer_subnet_02 = {
  id = "${composer_subnet_02}"
}

```
## 설치 방법

```sh
cd composer
terraform init
terraform plan
terraform apply

cd ../composer-service
terraform init
terraform plan
terraform apply

sh ../setup-automation/git-action-composer-setup.sh
sh ../setup-automation/git-action-composer-server-setup.sh
```

## 사용 예제

_더 많은 예제와 사용법은 [Wiki][wiki]를 참고하세요._

## 개발 환경 설정

## 업데이트 내역

- 0.0.1
  - 작업 진행 중

## 정보

박경열 – a1061602@gmail.com

MIT 라이센스를 준수하며 `LICENSE`에서 자세한 정보를 확인할 수 있습니다.

[https://github.com/ComposerLab/composer-architecture/blob/master/License](https://github.com/ComposerLab/composer-architecture/blob/master/License)

[wiki]: https://github.com/ComposerLab/composer-architecture/wiki
