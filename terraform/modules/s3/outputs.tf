output "token" {
  value       = random_password.s3_token.result
  sensitive   = true
  description = "Token"
}

output "url" {
  value       = "${var.node_ip}:${var.node_port}"
  description = "URL"
}