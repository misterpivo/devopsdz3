resource "aws_instance" "web_server" {
  ami                    = local.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_server.id]
  key_name               = aws_key_pair.deployer.key_name

  tags = { Name = "${var.project_name}-web-server", Role = "web_server" }
}

resource "aws_instance" "app" {
  ami                    = local.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.app.id]
  key_name               = aws_key_pair.deployer.key_name

  tags = { Name = "${var.project_name}-app", Role = "app" }
}
