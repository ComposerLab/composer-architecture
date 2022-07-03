variable "aws_region" {
  type        = string
  default     = "ap-northeast-2"
  description = "AWS region"
}

variable "subnet_dmz_01_values" {
  type = any
  description = "subnet dmz 01 values"
}

variable "subnet_dmz_02_values" {
  type = any
  description = "subnet dmz 02 values"
}

variable "subnet_01_values" {
  type = any
  description = "subnet 01 values"
}

variable "subnet_02_values" {
  type = any
  description = "subnet 02 values"
}

variable "database_subnet_01_values" {
  type = any
  description = "database subnet 01 values"
}

# variable "database_subnet_02_values" {
#   type = any
#   description = "database subnet 02 values"
# }

variable "route_table" {
  type = any
  description = "route_table values"
}