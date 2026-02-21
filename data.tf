data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

locals {
  ami_id          = var.ami_id != "" ? var.ami_id : data.aws_ami.ubuntu.id
  subdomain       = "${var.subdomain_prefix}.${var.domain_name}"
  web_server_fqdn = "web.${local.subdomain}"
  app_fqdn        = "app.${local.subdomain}"
}
