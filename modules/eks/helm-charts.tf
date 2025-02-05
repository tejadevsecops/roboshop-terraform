resource "null_resource" "kube-bootstrap" {
  provisioner "local-exec" {
    command = <<EOF
aws eks update-kubeconfig --name ${var.env}-eks
kubectl create ns devops
EOF
  }
}

resource "helm_release" "nginx-ingress" {
  depends_on = [null_resource.kube-bootstrap]
  chart = "oci://ghcr.io/nginx/charts/nginx-ingress"
  name  = "nginx-ingress"
  namespace = "devops"
  wait = true

  values = [
    file("${path.module}/helm-config/nginx-ingress.yml")
  ]
}