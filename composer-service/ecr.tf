resource "aws_ecr_repository" "web_repository" {
  name                 = local.web_ecr["repository_name"]
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "server_repository" {
  name                 = local.server_ecr["repository_name"]
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository_policy" "web_policy" {
  repository = aws_ecr_repository.web_repository.name
  policy     = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "adds full ecr access to the ${local.web_ecr["repository_name"]} repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  }
  EOF
}

resource "aws_ecr_repository_policy" "server_policy" {
  repository = aws_ecr_repository.server_repository.name
  policy     = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "adds full ecr access to the ${local.server_ecr["repository_name"]} repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  }
  EOF
}