resource "helm_release" "csi" {
  name             = "csi"
  namespace        = "csi"
  repository       = "https://raw.githubusercontent.com/kubernetes-sigs/secrets-store-csi-driver/master/charts"
  chart            = "secrets-store-csi-driver"
  create_namespace = true
  wait             = true
  version          = "0.0.23"

  values = [<<-EOF
    syncSecret:
      enabled: true
    EOF
  ]
}