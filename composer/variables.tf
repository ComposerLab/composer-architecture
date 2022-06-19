variable "aws_region" {
  type        = string
  default     = "ap-northeast-2"
  description = "AWS region"
}

variable "subnet_1_values" {
  type = any
  description = "subnet 1 values"
}

variable "subnet_2_values" {
  type = any
  description = "subnet 2 values"
}

variable "route_table" {
  type = any
  description = "route_table values"
}