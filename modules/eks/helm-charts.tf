terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.14.0"
    }
  }
}
resource "helm_release" "nginx-ingress" {
  chart = "oci://ghcr.io/nginx/charts/nginx-ingress"
  name  = "nginx-ingress"
}