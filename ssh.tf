resource "tls_private_key" "ssh" {
  count     = var.ssh_public_key_path == "" ? 1 : 0
  algorithm = "ED25519"
}

resource "aws_key_pair" "deployer" {
  key_name   = "${var.project_name}-deployer"
  public_key = var.ssh_public_key_path != "" ? file(var.ssh_public_key_path) : tls_private_key.ssh[0].public_key_openssh
  tags       = { Name = "${var.project_name}-deployer" }
}
