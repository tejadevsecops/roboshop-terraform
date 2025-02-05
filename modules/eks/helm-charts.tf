resource "helm_release" "nginx-ingress" {
  chart = "oci://ghcr.io/nginx/charts/nginx-ingress"
  name  = "nginx-ingress"
}