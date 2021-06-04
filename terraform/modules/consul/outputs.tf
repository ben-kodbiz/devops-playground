output "url" {
  value       = "${var.node_ip}:${var.node_port}"
  description = "URL"
}

output "ingress_gateway_urls" {
  value = {
    for name, node_port in var.node_ports : name => "${var.node_ip}:${node_port}"
  }
  description = "Ingress Gateway URLs"
}

output "ingress_gateway_port" {
  value       = var.ingress_gateway_port
  description = "Ingress Gateway port"
}