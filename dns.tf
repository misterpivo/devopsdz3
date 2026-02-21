resource "aws_route53_zone" "subdomain" {
  name    = local.subdomain
  comment = "Hosted zone for ${local.subdomain}"
  tags    = { Name = "${var.project_name}-hosted-zone" }
}

resource "aws_route53_record" "web_server" {
  zone_id = aws_route53_zone.subdomain.zone_id
  name    = local.web_server_fqdn
  type    = "A"
  ttl     = 300
  records = [aws_instance.web_server.public_ip]
}

resource "aws_route53_record" "app" {
  zone_id = aws_route53_zone.subdomain.zone_id
  name    = local.app_fqdn
  type    = "A"
  ttl     = 300
  records = [aws_instance.app.public_ip]
}

resource "cloudflare_record" "ns_delegation" {
  count = 4

  zone_id = var.cloudflare_zone_id
  name    = var.subdomain_prefix
  type    = "NS"
  content = aws_route53_zone.subdomain.name_servers[count.index]
  ttl     = 3600
}
