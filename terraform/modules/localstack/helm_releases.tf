resource "helm_release" "localstack" {
  name             = "localstack"
  namespace        = "localstack"
  repository       = "https://localstack.github.io/helm-charts"
  chart            = "localstack"
  create_namespace = true
  wait             = true
  version          = "0.3.4"

  values = [
    <<-EOF
    startServices: s3,dynamodb
    service:
      edgeService:
        nodePort: ${var.node_port}
    podAnnotations:
      'consul.hashicorp.com/connect-inject': "true"
      'consul.hashicorp.com/connect-service': "localstack"
      'consul.hashicorp.com/connect-service-port': "edge"
    persistence:
      enabled: true
    EOF
  ]
}
