variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "aws_token" {
  type      = string
  default   = ""
}

variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "tf_state_bucket" {
  type = string
}
