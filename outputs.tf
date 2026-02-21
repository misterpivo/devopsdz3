output "web_server_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "app_public_ip" {
  value = aws_instance.app.public_ip
}

output "web_server_fqdn" {
  value = local.web_server_fqdn
}

output "app_fqdn" {
  value = local.app_fqdn
}

output "route53_nameservers" {
  value = aws_route53_zone.subdomain.name_servers
}

output "ssh_private_key" {
  value     = var.ssh_public_key_path == "" ? tls_private_key.ssh[0].private_key_openssh : "Using provided key"
  sensitive = true
}
