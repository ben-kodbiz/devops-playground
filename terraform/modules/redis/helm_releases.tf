resource "helm_release" "redis" {
  name             = "redis"
  namespace        = "redis"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "redis"
  create_namespace = true
  wait             = true
  version          = "17.8.3"

  values = [
    <<-EOF
    architecture: standalone
    auth:
      password: ${random_password.redis_password.result}
    master:
      service:
        type: NodePort
        nodePorts:
          redis: ${var.node_port}
    EOF
  ]
}
