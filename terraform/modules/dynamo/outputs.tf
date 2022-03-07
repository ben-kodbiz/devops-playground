output "url" {
  value       = "${var.node_ip}:${var.node_port}"
  description = "URL"
}

output "cluster_url" {
  value       = "${helm_release.dynamo.name}.${helm_release.dynamo.namespace}.svc.cluster.local:8080"
  description = "Cluster URL"
}
