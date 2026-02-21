variable "project_name" {
  type    = string
  default = "lab-infra"
}

variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_id" {
  type    = string
  default = ""
}

variable "ssh_allowed_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

variable "cloudflare_zone_id" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "subdomain_prefix" {
  type    = string
  default = "aws"
}

variable "ssh_public_key_path" {
  type    = string
  default = ""
}
