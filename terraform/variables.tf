variable "aws_region" {
  default = "eu-west-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}